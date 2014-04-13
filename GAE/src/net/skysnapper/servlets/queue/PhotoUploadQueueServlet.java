/**
 * 
 */
package net.skysnapper.servlets.queue;

import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.entity.PhotoPost;
import net.skysnapper.services.SnapperService;
import net.skysnapper.util.Constants;

/**
 * @author LONJS43
 *
 */
public class PhotoUploadQueueServlet extends HttpServlet {

	private static final Logger LOGGER = Logger.getLogger(PhotoUploadQueueServlet.class.getName());
	
	/**
	 * generated version.
	 */
	private static final long serialVersionUID = 3871878751389878418L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		String keyString = request.getParameter(Constants.ParamNames.PHOTO_KEY);
		
		if (null != keyString) {
			LOGGER.info(keyString);
			SnapperService snapperService = SnapperService.getInstance();
			PhotoPost photo = snapperService.getPhoto(keyString);
			
			if (null != photo) {
				
				LOGGER.info("Processed photo: " + keyString);
				return;
			}
		}
		
		LOGGER.warning("Failed to process photo");
	}

}
