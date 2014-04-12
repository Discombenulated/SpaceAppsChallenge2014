/**
 * 
 */
package net.skysnapper.util;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


/**
 * @author LONJS43
 *
 */
public class JSON {

	private static final Logger LOGGER = Logger.getLogger(JSON.class.getName());
	
	/**
	 * Utility function to send a json response.
	 * @param resp the response object to write the json to.
	 * @param statusCode the HTTP status code to send
	 * @param json the JSON object to be sent
	 */
	public static void sendJson(HttpServletResponse resp, int statusCode, JSONObject json) {
		String jsonString = json.toJSONString();
		sendJson(resp, statusCode, jsonString);
	}
	
	/**
	 * Utility function to send a json response.
	 * @param resp the response object to write the json to.
	 * @param statusCode the HTTP status code to send
	 * @param jsonString the stringified JSON object to be sent
	 */
	public static void sendJson(HttpServletResponse resp, int statusCode, String jsonString) {
		resp.setStatus(statusCode);
		resp.setContentType("application/json");
				
		if (LOGGER.isLoggable(Level.FINE)) {
			LOGGER.fine("Sending json of length: " + jsonString.length());
			LOGGER.fine("Returning json to servlet: " + jsonString);
		}
		
		try {
			resp.getWriter().print(jsonString);
		} catch (IOException e) {
			LOGGER.warning("Failure to write json string to response");
		}
	}
}
