package akro.dao.option;

import java.util.List;
import java.util.Map;

import akro.dao.IBaseIaceDao;
import akro.entity.option.BaseOption;
import akro.entity.option.BaseOptionSearchModel;
import core.util.PagedList;

public interface IOptionDao<OptionEntity extends BaseOption> extends IBaseIaceDao<OptionEntity> {
	
	public OptionEntity getByCode(String code);
	
	public List<OptionEntity> listNotIn(List<String> codes);
	
	public List<String> listAllCode();
	
	/**
	 * 
	 * @return Map(code, OptionEntity)
	 */
	public Map<String, OptionEntity> mapAll();

	public PagedList<OptionEntity> searchBy(BaseOptionSearchModel args);
	
	public boolean isCodeExist(String code);
	
	public boolean isNameExist(String name);
	
	public boolean hasBeenUsed(OptionEntity entity);
	
	public boolean hasBeenUsed(Long id);
}
