/**
 * 
 */
package net.skysnapper.servlets;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.entity.PhotoPost;
import net.skysnapper.util.Constants;
import net.skysnapper.util.JSON;
import net.skysnapper.util.StringUtils;

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
	
	@SuppressWarnings("unchecked")
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		String keyString = request.getParameter(Constants.ParamNames.PHOTO_KEY);
		JSONObject obj = new JSONObject();
		
		if (null != keyString) {
			LOGGER.info(keyString);
			PhotoPost photo = ofy().load().type(PhotoPost.class).id(StringUtils.parseLong(keyString)).now();
			obj.put("id", photo.getId());
			obj.put("takenTimestamp", photo.getTakenTimestamp());
			obj.put("lat", photo.getLat());
			obj.put("lon", photo.getLon());
			obj.put("compassDegrees", photo.getCompassDegrees());
			obj.put("inclinationDegrees", photo.getInclinationDegrees());
			obj.put("averageR", photo.getAverageR());
			obj.put("averageG", photo.getAverageG());
			obj.put("averageB", photo.getAverageB());
			obj.put("palletR", photo.getPalletR());
			obj.put("palletG", photo.getPalletG());
			obj.put("palletB", photo.getPalletB());
		}
		
		JSON.sendJson(response, 200, obj);
	}
}
