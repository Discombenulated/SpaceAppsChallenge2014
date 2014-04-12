/**
 * 
 */
package net.skysnapper.util;

/**
 * @author LONJS43
 *
 */
public class StringUtils {

	public static Long parseLong(String str) {
		Long l = null;
		try {
			l = Long.parseLong(str);
		} catch (NumberFormatException e) {
		}
		
		return l;
	}
	
	public static boolean isNullOrEmpty(String str) {
		if (null != str) {
			return str.length() > 0;
		}
		
		return false;
	}
}
