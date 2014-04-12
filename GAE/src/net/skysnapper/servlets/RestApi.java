/**
 * 
 */
package net.skysnapper.servlets;

import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.services.SnapperService;
import net.skysnapper.util.Constants;
import net.skysnapper.util.JSON;

import org.json.simple.JSONObject;


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
		
		// photo upload api
		JSONObject photoUpload = new JSONObject();
		photoUpload.put("uploadURL", snapperService.getMobileUploadURL());
		photoUpload.put("testUploadURL", snapperService.getPhotoUploadURL());
		
		JSONObject params = new JSONObject();
		params.put("takenTimestamp", "UNIX timestamp milliseconds since 1970");
		params.put("lat", "float latitude");
		params.put("lon", "float longitude");
		params.put("compassDegrees", "float degrees");
		params.put("inclinationDegrees", "float degrees");
		photoUpload.put("parameters", params);
		
		api.put("photoUpload", photoUpload);
		
		
		// photo data api
		JSONObject photoData = new JSONObject();
		photoData.put("dataURL", Constants.RelativeURLs.PHOTO_DATA_URL);
		photoData.put("keyParamName", Constants.ParamNames.PHOTO_KEY);
		api.put("photoData", photoData);
		
		LOGGER.info(api.toJSONString());
		JSON.sendJson(response, 200, api);
	}
}
