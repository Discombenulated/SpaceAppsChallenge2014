/**
 * 
 */
package net.skysnapper.servlets;

import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.entity.PhotoPost;
import net.skysnapper.services.SnapperService;
import net.skysnapper.util.Constants;
import net.skysnapper.util.JSON;

import org.json.simple.JSONObject;

/**
 * @author LONJS43
 *
 */
public class PhotoDataServlet extends HttpServlet {

	private static final Logger LOGGER = Logger.getLogger(PhotoDataServlet.class.getName());
	
	/**
	 * generated version.
	 */
	private static final long serialVersionUID = 1051377078676334052L;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		doRequest(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doRequest(request, response);
	}
	
	/**
	 * @param request
	 * @param response
	 */
	@SuppressWarnings("unchecked")
	private void doRequest(HttpServletRequest request,
			HttpServletResponse response) {
		String keyString = request.getParameter(Constants.ParamNames.PHOTO_KEY);
		JSONObject obj = new JSONObject();
		
		if (null != keyString) {
			LOGGER.info(keyString);
			SnapperService snapperService = SnapperService.getInstance();
			PhotoPost photo = snapperService.getPhoto(keyString);
			
			if (null != photo) {
				obj.put("id", photo.getId());
				obj.put("uploadedTimestamp", null != photo.getUploadTimestamp() ? photo.getUploadTimestamp().getTime() : null);
				obj.put("takenTimestamp", null != photo.getTakenTimestamp() ? photo.getTakenTimestamp().getTime() : null);
				obj.put("lat", photo.getLat());
				obj.put("lon", photo.getLon());
				obj.put("compassDegrees", photo.getCompassDegrees());
				obj.put("inclinationDegrees", photo.getInclinationDegrees());
				obj.put("averageR", photo.getAverageR());
				obj.put("averageG", photo.getAverageG());
				obj.put("averageB", photo.getAverageB());
				obj.put("paletteR", photo.getPaletteR());
				obj.put("paletteG", photo.getPaletteG());
				obj.put("paletteB", photo.getPaletteB());
			}
		}
		
		JSON.sendJson(response, 200, obj);
	}
}
