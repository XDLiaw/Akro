/**
 * 
 */
package core.util;

import java.io.Closeable;
import java.io.IOException;

/**
 * <table>
 * <tr>
 * <th>版本</th>
 * <th>日期</th>
 * <th>詳細說明</th>
 * <th>modifier</th>
 * </tr>
 * <tr>
 * <td>1.0</td>
 * <td>2014/7/30</td>
 * <td>新建檔案</td>
 * <td>EricLiao</td>
 * </tr>
 * </table>
 * @author EricLiao
 *
 * 類別說明 :
 *
 *
 * 版權所有 Copyright 2008 © 中菲電腦股份有限公司 本網站內容享有著作權，禁止侵害，違者必究。 <br>
 * (C) Copyright Dimerco Data System Corporation Inc., Ltd. 2009 All Rights
 */
public class CloseableTool {
	public static void close(Closeable c) {
		try {
			c.close();
		} catch (IOException e) {
//			e.printStackTrace();
		} catch (NullPointerException e) {
//			e.printStackTrace();
		}
	}
	
	public static void close(AutoCloseable c) {
		try {
			c.close();
		} catch (IOException e) {
//			e.printStackTrace();
		} catch (NullPointerException e) {
//			e.printStackTrace();
		} catch (Exception e) {
//			e.printStackTrace();
		}
	}


}
