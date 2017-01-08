package core.action;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;

import core.util.Validator;

public abstract class BaseAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6715574015720566257L;

	protected static Logger log = LogManager.getLogger(BaseAction.class);
	


	protected boolean validateNotNull(Object testValue, String fieldName, String errMsg) {
		if (testValue == null) {
			this.addFieldError(fieldName, errMsg);
			return false;
		}
		return true;
	}
	
	protected boolean validateNotNull(Object testValue, String fieldName) {
		return validateNotNull(testValue, fieldName, "不可為空");
	}
	
	protected boolean validateNotBlank(CharSequence testValue, String fieldName, String errMsg) {
		if (StringUtils.isBlank(testValue)) {
			this.addFieldError(fieldName, errMsg);
			return false;
		}
		return true;
	}

	protected boolean validateNotBlank(CharSequence testValue, String fieldName) {
		return validateNotBlank(testValue, fieldName, "不可為空白");
	}

	protected boolean validateTextMinLength(CharSequence testValue, int len, String fieldName, String errMsg) {
		if (StringUtils.length(testValue) < len) {
			this.addFieldError(fieldName, errMsg);
			return false;
		}
		return true;
	}

	protected boolean validateTextMinLength(CharSequence testValue, int len, String fieldName) {
		return validateTextMinLength(testValue, len, fieldName, "長度最少要" + len);
	}
	
	protected boolean validateTextMaxLength(CharSequence testValue, int maxLen, String fieldName, String errMsg) {
		if (StringUtils.length(testValue) > maxLen) {
			this.addFieldError(fieldName, errMsg);
			return false;
		}
		return true;
	}
	
	protected boolean validateTextMaxLength(CharSequence testValue, int maxLen, String fieldName) {
		return validateTextMaxLength(testValue, maxLen, fieldName, "長度不可超過" + maxLen);
	}
	
	protected boolean validateTextLength(CharSequence testValue, int minLen, int maxLen, String fieldName, String errMsg) {
		if (StringUtils.length(testValue) < minLen || StringUtils.length(testValue) > maxLen) {
			this.addFieldError(fieldName, errMsg);
			return false;
		}
		return true;
	}
	
	protected boolean validateTextLength(CharSequence testValue, int minLen, int maxLen, String fieldName) {
		String errMsg= "長度必須介於"+minLen+"~"+maxLen;
		return validateTextLength(testValue, minLen, maxLen, fieldName, errMsg);
	}

	protected boolean validateNotBlankNLength(CharSequence testValue, int maxLen, String fieldName) {
		if (validateNotBlank(testValue, fieldName)) {
			return validateTextMaxLength(testValue, maxLen, fieldName);
		}
		return false;
	}
	
	protected boolean validateEmail(CharSequence testValue, String fieldName, String errMsg) {
		String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(testValue);
		boolean isValid = m.matches();
		if (isValid == false) {
			this.addFieldError(fieldName, errMsg);
		}
		return isValid;
	}

	protected boolean validateEmail(CharSequence testValue, String fieldName) {
		return validateEmail(testValue, fieldName, "必須是有效的email格式");
	}
	
	protected boolean validateTWPID(CharSequence testValue, String fieldName, String errMsg) {
		boolean isValid = Validator.isValidTWPID((String) testValue);
		if (isValid == false) {
			this.addFieldError(fieldName, errMsg);
		}
		return isValid;
	}
	
	protected boolean validateTWPID(CharSequence testValue, String fieldName) {
		return validateTWPID(testValue, fieldName, "必須是有效的身分證");
	}
	
	protected boolean validateNumberRange(double testValue, double max, double min, String fieldName, String errMsg) {
		if (testValue > max || testValue < min) {
			this.addFieldError(fieldName, errMsg);
			return false;
		}
		return true;
	}
	
	protected boolean validateNumberRange(double testValue, double max, double min, String fieldName) {
		return validateNumberRange(testValue, max, min, fieldName, "必須介於"+min+"~"+max+"之間");
	}
	
	/**
	 * @param num
	 * @return 回傳小數點位數
	 */
	private static int getDecimalPlace(Object num) {
		int result = 0;
		String sTarget = String.valueOf(num);
		if (sTarget.indexOf('.') == -1 || sTarget.endsWith(".0")) {
			result = 0;
	    } else {
	    	result = sTarget.length() - sTarget.indexOf('.') - 1; 
	    }
		return result;
	}
	
	protected boolean validateNumberRange(Object testValue, int precision, int scale, String fieldName, String errMsg) {
		double max = Math.pow(10, precision-scale);
		boolean isValid = false;
		if (byte.class.isInstance(testValue) || Byte.class.isInstance(testValue)) {
			isValid = (getDecimalPlace(testValue) <= scale && (byte)testValue < max);	
		} else if (short.class.isInstance(testValue) || Short.class.isInstance(testValue)) {
			isValid = (getDecimalPlace(testValue) <= scale && (short)testValue < max);
		} else if (int.class.isInstance(testValue) || Integer.class.isInstance(testValue)) {
			isValid = (getDecimalPlace(testValue) <= scale && (int)testValue < max);		
		} else if (long.class.isInstance(testValue) || Long.class.isInstance(testValue)) {
			isValid = (getDecimalPlace(testValue) <= scale && (long)testValue < max);
		} else if (float.class.isInstance(testValue) || Float.class.isInstance(testValue)) {
			isValid = (getDecimalPlace(testValue) <= scale && (float)testValue < max);
		} else if (double.class.isInstance(testValue) || Double.class.isInstance(testValue)) {
			isValid = (getDecimalPlace(testValue) <= scale && (double)testValue < max);
		} else {
			throw new IllegalArgumentException("Unsupported class!");
		}
		
		if (isValid == false) {
			this.addFieldError(fieldName, errMsg);
		}
		return isValid;
	}
	
	protected boolean validateNumberRange(Object testValue, int precision, int scale, String fieldName) {
		String msg = String.format("有效範圍(整數%d位, 小數%d位)", precision-scale, scale);
		return validateNumberRange(testValue, precision, scale, fieldName, msg);
	}
}
