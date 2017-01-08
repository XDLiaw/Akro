package akro.service.option;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import akro.dao.option.IOptionDao;
import akro.entity.option.BaseOption;
import akro.entity.option.BaseOptionSearchModel;
import akro.entity.option.BatchImportOptionResult;
import core.service.BaseService;
import core.util.CloseableTool;
import core.util.PagedList;

public abstract class BaseOptionService<OptionEntity extends BaseOption> extends BaseService<OptionEntity, Long> {
	protected IOptionDao<OptionEntity> dao;
	protected Class<OptionEntity> optoinEntityClass;

	protected BaseOptionService(IOptionDao<OptionEntity> dao, Class<OptionEntity> optoinEntityClass) {
		this.dao = dao;
		this.optoinEntityClass = optoinEntityClass;
	}
	
	public List<OptionEntity> listAll() {
		return dao.listAll();
	}
	
	public List<OptionEntity> listNotIn(List<String> codes) {
		return dao.listNotIn(codes);
	}
	
	public PagedList<OptionEntity> searchBy(BaseOptionSearchModel args) {
		return this.dao.searchBy(args);
	}
	
	@Override
	public OptionEntity get(Long id) {
		return dao.get(id);
	}
	
	public OptionEntity getByCode(String code) {
		return dao.getByCode(code);
	}

	@Override
	public void create(OptionEntity entity) {
		entity.setCode(entity.getCode().trim());
		entity.setName(entity.getName().trim());
		dao.create(entity);
	}
	
	public int createAll(List<OptionEntity> entities) {
		List<OptionEntity> entitiesWithoutExist = new ArrayList<OptionEntity>();
		List<String> codeList = this.dao.listAllCode();
		for (OptionEntity opt : entities) {
			opt.setCode(opt.getCode().trim());
			opt.setName(opt.getName().trim());
			if (codeList.contains(opt.getCode()) == false) {
				entitiesWithoutExist.add(opt);
			}
		}		
		
		dao.createAll(entitiesWithoutExist);
		return entitiesWithoutExist.size();
	}

	@Override
	public void update(OptionEntity entity) {
		if (hasBeenUsed(entity)) {
			String msg = "無法編輯已被使用的代碼!";
			throw new IllegalArgumentException(msg);
		}
		entity.setCode(entity.getCode().trim());
		entity.setName(entity.getName().trim());
		dao.update(entity);
	}

	@Override
	public void delete(OptionEntity entity) {
		if (hasBeenUsed(entity)) {
			String msg = "無法刪除已被使用的代碼!";
			throw new IllegalArgumentException(msg);
		}
		dao.delete(entity);		
	}
	
	public void delete(Long id) {
		if (hasBeenUsed(id)) {
			String msg = "無法刪除已被使用的代碼!";
			throw new IllegalArgumentException(msg);
		}
		dao.delete(id);
	}
	
	public boolean isCodeExist(String code) {
		return dao.isCodeExist(code);
	}
	
	public boolean hasBeenUsed(OptionEntity entity) {
		return dao.hasBeenUsed(entity);
	}
	
	public boolean hasBeenUsed(Long id) {
		return dao.hasBeenUsed(id);
	}
	
	/**
	 * 
	 * @param uploadFile
	 * @return JSONObject
	 * {"createCount":int, "updateCount":int, "error":List<String> errorMsgs}
	 * 
	 * @throws IOException
	 */
	public BatchImportOptionResult batchImport(File uploadFile) throws IOException {
		BatchImportOptionResult res = new BatchImportOptionResult();
		
		Map<String, OptionEntity> oldOptions = this.dao.mapAll();	
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(uploadFile);
			XSSFWorkbook wb = new XSSFWorkbook(fis);
			XSSFSheet sheet = wb.getSheetAt(0);
			for (int r = 1; r <= sheet.getLastRowNum(); r++) {
				int c = -1;
				XSSFRow row = sheet.getRow(r);
				XSSFCell cell;
				try {
					OptionEntity option = optoinEntityClass.newInstance();
					
					cell = row.getCell(++c);
					cell.setCellType(Cell.CELL_TYPE_STRING);
					option.setCode(cell.getStringCellValue().trim());
					
					cell = row.getCell(++c);
					cell.setCellType(Cell.CELL_TYPE_STRING);
					option.setName(cell.getStringCellValue().trim());
					
					option.setPriority(row.getCell(++c).getNumericCellValue());
					
					if (oldOptions.containsKey(option.getCode())) {
						OptionEntity oldOption = oldOptions.get(option.getCode());
						oldOption.setName(option.getName());
						oldOption.setPriority(option.getPriority());
						this.dao.update(oldOption);
						res.addUpdateOption(oldOption);
					} else {
						this.dao.create(option);
						res.addNewOption(option);
					}					
				} catch (Exception e) {
					String msg = String.format("第 %d 列第 %d 欄資料有問題! %s", r+1, c+1, e.getMessage());
					res.addErrMsg(msg);
				} 			
			}			
		} catch (IOException e) {
			throw e;
		} finally {
			CloseableTool.close(fis);
		}
		
		return res;
	}
}
