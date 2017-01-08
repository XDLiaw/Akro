package akro.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import core.util.CloseableTool;

public abstract class BaseExcelService {
	protected static Logger log = Logger.getLogger(BaseExcelService.class);
	protected final static SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	
	protected XSSFWorkbook getXlsxFile(File file) throws IOException {
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			XSSFWorkbook wb = new XSSFWorkbook(fis);
			return wb;
		} catch (IOException e) {
			throw e;
		} finally {
			CloseableTool.close(fis);
		}
	}
	
	/**
	 * 
	 * @param r row index. start with 0
	 * @param c column index. start with 0
	 * @return
	 */
	protected XSSFCell getCell(XSSFSheet sheet, int r, int c) {
		XSSFRow row = sheet.getRow(r);
		XSSFCell cell = row.getCell(c, Row.CREATE_NULL_AS_BLANK);
		return cell;		
	}
	
	protected XSSFCell setCellValue(XSSFCell cell, Object value) {
		if (value != null) {
			cell.setCellValue(value.toString());
		} else {
			cell.setCellValue("");
		}
		return cell;
	}
	
	protected XSSFCell setCellValue(XSSFCell cell, String value) {
		if (value != null) {
			cell.setCellValue(value);
		} else {
			cell.setCellValue("");
		}
		return cell;
	}
	
	protected XSSFCell setCellValue(XSSFCell cell, Integer value) {
		if (value != null) {
			cell.setCellValue(value);
		} else {
			cell.setCellValue("");
		}
		return cell;
	}
	
	protected XSSFCell setCellValue(XSSFCell cell, Timestamp value) {
		if (value != null) {
			cell.setCellValue(sdf.format(value));
		} else {
			cell.setCellValue("");
		}
		return cell;
	}

}
