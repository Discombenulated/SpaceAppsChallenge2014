/**
 * 
 */
package net.skysnapper.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import net.skysnapper.entity.PhotoPost;
import net.skysnapper.util.JSON;

import com.googlecode.objectify.Key;

/**
 * @author LONJS43
 *
 */
public class MobileUploadServlet extends UploadPhotoServlet {

	/**
	 * generated version.
	 */
	private static final long serialVersionUID = -1861217729907851987L;

	@SuppressWarnings("unchecked")
	@Override
	protected void postUpload(HttpServletRequest req, HttpServletResponse resp, Key<PhotoPost> photoPostKey) throws IOException {
		JSONObject json = new JSONObject();
		json.put("photoId", photoPostKey.getId());
		JSON.sendJson(resp, 200, json);
	}
}
