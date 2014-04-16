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
			
			if (null != photo) {
				if (snapperService.isOnAppSpot()) {
					Image originalImage = ImagesServiceFactory.makeImageFromFilename(photo.getFilename());
					ImagesService imagesService = ImagesServiceFactory.getImagesService();
					Transform resize = ImagesServiceFactory.makeCrop(0.33, 0.33, 0.66, 0.66);
					
					Image croppedImage = imagesService.applyTransform(resize, originalImage); 
					
					int[][] hist = imagesService.histogram(croppedImage);
					int[] average = new int[3];
					
					for (int i = 0; i < 3; i++) {
						long sum = 0;
						long count = 0;
						for (int rgbValue = 0; rgbValue < 256; rgbValue++) {
							count += hist[i][rgbValue];
							sum += hist[i][rgbValue] * rgbValue;
						}
						average[i] = (int) (sum / count);
					}
					
					photo.setAverageR(average[0]);
					photo.setAverageG(average[1]);
					photo.setAverageB(average[2]);
				} else {
					photo.setAverageR((int) (Math.random() * 255));
					photo.setAverageG((int) (Math.random() * 255));
					photo.setAverageB((int) (Math.random() * 255));
				}
				snapperService.savePhoto(photo);
				
				LOGGER.info("Processed photo: " + keyString + " average RGB: " + photo.getAverageR() + "," + photo.getAverageG() + "," + photo.getAverageB());
				return;
			}
		}
		
		LOGGER.warning("Failed to process photo");
	}

}
