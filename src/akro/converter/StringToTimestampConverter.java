package akro.converter;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.opensymphony.xwork2.conversion.TypeConversionException;

public class StringToTimestampConverter extends StrutsTypeConverter {

	private static final DateFormat df_date = new SimpleDateFormat("yyyy/MM/dd");
	private static final DateFormat df_date_HHmm = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	private static final DateFormat df_date_HHmmss = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	private static final DateFormat df_date_HHmmssSSS = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS");

	@SuppressWarnings("rawtypes")
	@Override
	public Timestamp convertFromString(Map context, String[] strings, Class toClass) {     
        if (strings == null || strings.length == 0 || strings[0].trim().length() == 0) {
            return null;
        }

		try {
			Date date = null;
			switch (strings[0].trim().length()) {
			case 10: 
				date = df_date.parse(strings[0]);
				break;
			case 16:
				date = df_date_HHmm.parse(strings[0]);
				break;
			case 19:
				date = df_date_HHmmss.parse(strings[0]);
				break;
			default:
				date = df_date_HHmmssSSS.parse(strings[0]);
				break;				
			}

			return new Timestamp(date.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
			 throw new TypeConversionException("Unable to convert given object to Timestamp: " + strings[0]);
		}
    }

	@SuppressWarnings("rawtypes")
	@Override
    public String convertToString(Map context, Object date) {
        if (date != null && date instanceof Date) {         
            return df_date_HHmmssSSS.format(date);
        } else {
            return null;
        }
    }

}
