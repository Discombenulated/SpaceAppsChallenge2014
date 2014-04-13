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
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.Transform;

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
			
			if (null != photo && snapperService.isOnAppSpot()) {
				Image originalImage = ImagesServiceFactory.makeImageFromFilename(photo.getFilename());
				ImagesService imagesService = ImagesServiceFactory.getImagesService();
				Transform resize = ImagesServiceFactory.makeCrop(0.33, 0.33, 0.66, 0.66);
				
				Image croppedImage = imagesService.applyTransform(resize, originalImage); 
				
				int[][] hist = imagesService.histogram(croppedImage);
				int[] average = new int[3];
				
				for (int i = 0; i < 3; i++) {
					long sum = 0;
					for (int j = 0; j < 256; j++) {
						sum += hist[i][j];
					}
					average[i] = (int) sum / 256;
				}
				
				photo.setAverageR(average[0]);
				photo.setAverageG(average[1]);
				photo.setAverageB(average[2]);
				
				snapperService.savePhoto(photo);
				
				LOGGER.info("Processed photo: " + keyString + " average RGB: " + average[0] + "," + average[1] + "," + average[2]);
				return;
			}
		}
		
		LOGGER.warning("Failed to process photo");
	}

}
