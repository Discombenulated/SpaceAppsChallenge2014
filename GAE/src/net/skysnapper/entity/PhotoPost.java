/**
 * 
 */
package net.skysnapper.entity;

import java.util.Date;

import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

/**
 * @author LONJS43
 *
 */
public class PhotoPost {

	@Id
	Long id;
	String title;
	@Index
	Date timestamp;
	String filename;
	
	static ImagesService imagesService = ImagesServiceFactory.getImagesService();

	public PhotoPost() {
	}

	public PhotoPost(String title, String filename) {
		this.timestamp = new Date();
		this.title = title;
		this.filename = filename;
	}

	public String getTitle() {
		return title;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public String getFilename() {
		return filename;
	}
	
	public String getURL(){
		ServingUrlOptions options = ServingUrlOptions.Builder.withGoogleStorageFileName(filename);
	    return imagesService.getServingUrl(options);
	}
	
	public Key<PhotoPost> getKey() {
		return Key.create(this);
	}
}
