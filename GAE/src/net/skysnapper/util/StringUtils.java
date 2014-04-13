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
	
	/**
	 * Check whether a string contains visible content.
	 * 
	 * @param s
	 *            the string to test
	 * @return true if the string is null, or only contains white-space (spaces,
	 *         tabs, carriage returns, etc).
	 */
	public static boolean isNullOrEmpty(String s) {
		return (null == s || "".equals(s.trim()));
	}
	
	/**
	 * Escape a string for HTML.
	 * @param o Object to all toString on and to escape
	 * @return escaped string, if s was null, then the empty string
	 */
	public static String escape(Object o) {
		if (null == o) {
			return "";
		}
		return o.toString().replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
				.replace("\"", "&quot;").replace("'", "&#39;");
	}
}
