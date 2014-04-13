/**
 * 
 */
package net.skysnapper.entity;

import java.util.Date;

import net.skysnapper.services.SnapperService;

import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

/**
 * @author LONJS43
 *
 */
@Entity
@Cache
public class PhotoPost {

	/**
	 * DO NOT CHANGE VARIABLE NAMES!!!
	 * They are the names of the fields of the entity in DataStore.
	 */
	@Id
	Long id;
	@Index
	Date timestamp;
	String filename;
	@Index
	Date takenTimestamp;
	String lat;
	String lon;
	String compassDegrees;
	String inclinationDegrees;
	Integer averageR;
	Integer averageG;
	Integer averageB;
	Integer paletteR;
	Integer paletteG;
	Integer paletteB;
	
	static ImagesService imagesService = ImagesServiceFactory.getImagesService();

	public PhotoPost() {
	}

	public PhotoPost(String filename, Date takenTimestamp, String lat, String lon, String compassDegrees, String inclinationDegrees) {
		this.timestamp = new Date();
		this.filename = filename;
		this.takenTimestamp = takenTimestamp;
		this.lat = lat;
		this.lon = lon;
		this.compassDegrees = compassDegrees;
		this.inclinationDegrees = inclinationDegrees;
	}

	public Date getUploadTimestamp() {
		return timestamp;
	}

	public String getFilename() {
		return filename;
	}
	
	public String getURL(){
		ServingUrlOptions options = ServingUrlOptions.Builder.withGoogleStorageFileName(filename);
		SnapperService snapperService = SnapperService.getInstance();
		
		if (snapperService.isOnAppSpot()) {
			return imagesService.getServingUrl(options);
		} else {
			return "";
		}
	}
	
	public Key<PhotoPost> getKey() {
		return Key.create(this);
	}
	
	public Long getId() {
		return id;
	}

	/**
	 * @return the compassDegrees
	 */
	public String getCompassDegrees() {
		return compassDegrees;
	}

	/**
	 * @return the inclinationDegrees
	 */
	public String getInclinationDegrees() {
		return inclinationDegrees;
	}

	/**
	 * @return the averageR
	 */
	public Integer getAverageR() {
		return averageR;
	}

	/**
	 * @param averageR the averageR to set
	 */
	public void setAverageR(Integer averageR) {
		this.averageR = averageR;
	}

	/**
	 * @return the averageG
	 */
	public Integer getAverageG() {
		return averageG;
	}

	/**
	 * @param averageG the averageG to set
	 */
	public void setAverageG(Integer averageG) {
		this.averageG = averageG;
	}

	/**
	 * @return the averageB
	 */
	public Integer getAverageB() {
		return averageB;
	}

	/**
	 * @param averageB the averageB to set
	 */
	public void setAverageB(Integer averageB) {
		this.averageB = averageB;
	}

	/**
	 * @return the paletteR
	 */
	public Integer getPaletteR() {
		return paletteR;
	}

	/**
	 * @param paletteR the paletteR to set
	 */
	public void setPaletteR(Integer paletteR) {
		this.paletteR = paletteR;
	}

	/**
	 * @return the paletteG
	 */
	public Integer getPaletteG() {
		return paletteG;
	}

	/**
	 * @param paletteG the paletteG to set
	 */
	public void setPaletteG(Integer paletteG) {
		this.paletteG = paletteG;
	}

	/**
	 * @return the paletteB
	 */
	public Integer getPaletteB() {
		return paletteB;
	}

	/**
	 * @param paletteB the paletteB to set
	 */
	public void setPaletteB(Integer paletteB) {
		this.paletteB = paletteB;
	}

	/**
	 * @return the takenTimestamp
	 */
	public Date getTakenTimestamp() {
		return takenTimestamp;
	}

	/**
	 * @return the lat
	 */
	public String getLat() {
		return lat;
	}

	/**
	 * @return the lon
	 */
	public String getLon() {
		return lon;
	}
}
