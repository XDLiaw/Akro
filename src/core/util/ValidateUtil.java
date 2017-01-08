package core.util;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

public class ValidateUtil {
	
	
	public static boolean notBlankNLength(CharSequence testValue, int maxLen, String fieldName, List<String> errMsgs) {
		if (StringUtils.isBlank(testValue)) {
			errMsgs.add(fieldName+"不可為空");
			return false;
		}
		if (StringUtils.length(testValue) > maxLen) {
			errMsgs.add(fieldName+"長度不可超過"+maxLen);
			return false;
		}
		return true;
	} 
	
	public static boolean maxLength(CharSequence testValue, int maxLen, String fieldName, List<String> errMsgs) {
		if (StringUtils.length(testValue) > maxLen) {
			errMsgs.add(fieldName+"長度不可超過"+maxLen);
			return false;
		}
		return true;
	}

	public static boolean notBlank(CharSequence testValue, String fieldName, List<String> errMsgs) {
		if (StringUtils.isBlank(testValue)) {
			errMsgs.add(fieldName+"不可為空");
			return false;
		}
		return true;
	}
	
	public static boolean notNull(Object testValue, String fieldName, List<String> errMsgs) {
		if (testValue == null) {
			errMsgs.add(fieldName+"不可為空");
			return false;
		}
		return true;
	}
}
