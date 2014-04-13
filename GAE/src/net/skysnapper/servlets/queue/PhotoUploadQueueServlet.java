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

import com.google.appengine.api.images.Image;
import com.google.appengine.api.images.ImagesServiceFactory;

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
	
	private static final SnapperService snapperService = SnapperService.getInstance();

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String keyString = request.getParameter(Constants.ParamNames.PHOTO_KEY);
		
		if (null != keyString) {
			LOGGER.info(keyString);
			PhotoPost photo = snapperService.getPhoto(keyString);
			
			if (null != photo) {
				Image image = ImagesServiceFactory.makeImageFromFilename(photo.getFilename());
				byte[] imageData = image.getImageData();

				int h = image.getHeight();
				int w = image.getWidth();
				
				LOGGER.info("h:" + h + " w:" + w + " " + (h*w*3) + "=" + imageData.length);
				
				LOGGER.info("Processed photo: " + keyString);
				return;
			}
		}
		
		LOGGER.warning("Failed to process photo");
	}

}
