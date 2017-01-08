package akro.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import core.util.Validator;

public class BatchSendEmailAction extends BaseIaceAction {
	private static final long serialVersionUID = 4571211046956970279L;

	private File uploadFile;
	private String uploadFileContentType;
	private String uploadFileFileName;
	
	private String emailSenderName, emailFrom, emailSubject, emailContentTemplate;
	
	private List<File> attaches = new ArrayList<File>();
	private List<String> attachesContentType = new ArrayList<String>();
	private List<String> attachesFileName = new ArrayList<String>();
	
	private List<String> errMsgs;
	
	public BatchSendEmailAction() {
		super.setTitle("批次寄送Email");
	}
	
	public String sendEmail() {
		return SUCCESS;
	}
	
	public void validateSendEmailSubmit() {
		if (this.uploadFile == null) {
			super.addFieldError("uploadFile", "請選擇收件者檔案");
		}
		if (super.validateNotBlank(this.emailFrom, "emailFrom")) {
			super.validateEmail(this.emailFrom, "emailFrom");
		}
		super.validateNotBlank(this.emailSubject, "emailSubject");
		super.validateNotBlank(this.emailContentTemplate, "emailContentTemplate");
	}
	
	public String sendEmailSubmit() {
		try {
			this.errMsgs = new ArrayList<String>();
			
			// read data from uploadFile
			List<String> keywordList = new ArrayList<String>();
			List<Map<String, String>> excelDatas = new ArrayList<Map<String, String>>();
			try (FileInputStream fis = new FileInputStream(this.uploadFile);){
				XSSFWorkbook wb = new XSSFWorkbook(fis);
				XSSFSheet sheet = wb.getSheetAt(0);
				
				XSSFRow row;
				XSSFCell cell;
				
				// read title row to get keyword
				{
					row = sheet.getRow(0);
					for (int c = 0; c < row.getLastCellNum(); c++) {
						cell = row.getCell(c);
						if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK) {
							cell.setCellType(Cell.CELL_TYPE_STRING);
							keywordList.add(cell.getStringCellValue().trim());
						} else {
							keywordList.add("");
						}
					}
				}
				
				// read all data row
				for (int r = 1; r <= sheet.getLastRowNum(); r++) {
					int c = -1;
					row = sheet.getRow(r);
					Map<String, String> rowData = new HashMap<String, String>();
					try {
						cell = row.getCell(++c);
						cell.setCellType(Cell.CELL_TYPE_STRING);
						String email = cell.getStringCellValue().trim();
						email = email.replace("；", ";");
						String[] emails = email.split(";");
						for (String e : emails){
							if (Validator.isValidEmail(e) == false) {
								throw new IllegalArgumentException("必須是有效的Email格式，並請檢查是否含有[空白]、[特殊符號]、[非英數字元]");
							}
						}
						rowData.put(keywordList.get(c), email);
						
						while (c+1 < keywordList.size()) {
							cell = row.getCell(++c);
							if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK) {
								cell.setCellType(Cell.CELL_TYPE_STRING);
								rowData.put(keywordList.get(c), cell.getStringCellValue().trim());
							} else {
								rowData.put(keywordList.get(c), "");
							}
						}
						
						excelDatas.add(rowData);
					} catch (Exception e) {
						log.warn("", e);
						String msg = String.format("%d列%d欄 → %s", r+1, c+1, e.getMessage());
						errMsgs.add(msg);
					} 
				}
			} catch (IOException e) {
				throw e;
			}
			
			if (this.errMsgs == null || this.errMsgs.size() == 0) {
				batchSendEmail(keywordList, excelDatas);
				super.addActionMessage("批次寄送"+excelDatas.size()+"郵件完成");
			} else {
				super.addActionError("錯誤!請查閱下方錯誤訊息列表");
			}
			return SUCCESS;
		} catch (Exception e) {
			super.showExceptionToPage(e);
			return ERROR;
		}
	}
	
	private void batchSendEmail(List<String> keywordList, List<Map<String, String>> datas) throws Exception {
		Properties props = new Properties();
		props.load(this.getClass().getClassLoader().getResourceAsStream("configs/mail.smtp.properties"));
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(props, null); // 取得與SMTP

		for (int email_index = 0; email_index<datas.size(); email_index++) {
			try {
				Map<String, String> rowData = datas.get(email_index);
				MimeMessage msg = new MimeMessage(session); // 取得一Mime的Message
				msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
				
				// set FROM
				msg.setFrom(new InternetAddress(this.emailFrom, this.emailSenderName, "UTF-8"));
				
				// set TO
				List<InternetAddress> addressList = new ArrayList<InternetAddress>();
				for (String email : rowData.get(keywordList.get(0)).split(";")) {
					addressList.add(new InternetAddress(email));
				}
				InternetAddress[] address = addressList.toArray(new InternetAddress[addressList.size()]);	
				msg.setRecipients(Message.RecipientType.TO, address);
				
				// set Subject
				msg.setSubject(this.emailSubject, "utf-8");
				
				// set content
				{
					Multipart multipart = new MimeMultipart();

					// set actual message
					{
						MimeBodyPart messageBodyPart = new MimeBodyPart();
						String content = this.emailContentTemplate;
						for (int i=0; i<keywordList.size(); i++) {
							String keyword = keywordList.get(i);
							if (keyword.startsWith("%") && keyword.endsWith("%")) {
								content = content.replace(keyword, rowData.get(keyword));
							}
						}
						messageBodyPart.setContent(content, "text/html; charset=utf-8");
						multipart.addBodyPart(messageBodyPart);
					}
					
					// add attaches 
					for (int i = 0; i< this.attaches.size(); i++) {
						MimeBodyPart messageBodyPart = new MimeBodyPart();
						DataSource source = new FileDataSource(this.attaches.get(i));
						messageBodyPart.setDataHandler(new DataHandler(source));
						messageBodyPart.setFileName(this.attachesFileName.get(i));
						multipart.addBodyPart(messageBodyPart);
					}
					
					msg.setContent(multipart);
				}
				
				Transport.send(msg);
			} catch (Exception e) {
				String msg = "已發送"+(email_index)+"次郵件，但出現錯誤導致後續郵件沒有發送";
				throw new Exception(msg, e);
			}
		}
	}
	
	// =========================================================================

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public String getEmailSenderName() {
		return emailSenderName;
	}

	public void setEmailSenderName(String emailSenderName) {
		this.emailSenderName = emailSenderName;
	}

	public String getEmailFrom() {
		return emailFrom;
	}

	public void setEmailFrom(String emailFrom) {
		this.emailFrom = emailFrom;
	}

	public String getEmailSubject() {
		return emailSubject;
	}

	public void setEmailSubject(String emailSubject) {
		this.emailSubject = emailSubject;
	}

	public String getEmailContentTemplate() {
		return emailContentTemplate;
	}

	public void setEmailContentTemplate(String emailContentTemplate) {
		this.emailContentTemplate = emailContentTemplate;
	}

	public List<String> getErrMsgs() {
		return errMsgs;
	}

	public List<File> getAttaches() {
		return attaches;
	}

	public void setAttaches(List<File> attaches) {
		this.attaches = attaches;
	}

	public List<String> getAttachesContentType() {
		return attachesContentType;
	}

	public void setAttachesContentType(List<String> attachesContentType) {
		this.attachesContentType = attachesContentType;
	}

	public List<String> getAttachesFileName() {
		return attachesFileName;
	}

	public void setAttachesFileName(List<String> attachesFileName) {
		this.attachesFileName = attachesFileName;
	}
	
	

}
