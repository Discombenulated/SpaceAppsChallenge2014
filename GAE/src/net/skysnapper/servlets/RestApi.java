/**
 * 
 */
package net.skysnapper.servlets;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;





import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import net.skysnapper.services.SnapperService;
import net.skysnapper.util.JSON;


/**
 * @author LONJS43
 *
 */
public class RestApi extends HttpServlet {

	/**
	 * generated version.
	 */
	private static final long serialVersionUID = -562627498482659781L;

	private static final Logger LOGGER = Logger.getLogger(RestApi.class.getName());
	
	@SuppressWarnings("unchecked")
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		SnapperService snapperService = SnapperService.getInstance();
		
		JSONObject api = new JSONObject();
		JSONObject photoUpload = new JSONObject();
		String apiName = "photoUpload";
		photoUpload.put("uploadURL", snapperService.getPhotoUploadURL());
		api.put(apiName, photoUpload);
		LOGGER.info(api.toJSONString());
		JSON.sendJson(response, 200, api);
	}
	
}
