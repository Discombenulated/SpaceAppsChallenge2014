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
	Integer palletR;
	Integer palletG;
	Integer palletB;
	
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
	 * @return the palletR
	 */
	public Integer getPalletR() {
		return palletR;
	}

	/**
	 * @param palletR the palletR to set
	 */
	public void setPalletR(Integer palletR) {
		this.palletR = palletR;
	}

	/**
	 * @return the palletG
	 */
	public Integer getPalletG() {
		return palletG;
	}

	/**
	 * @param palletG the palletG to set
	 */
	public void setPalletG(Integer palletG) {
		this.palletG = palletG;
	}

	/**
	 * @return the palletB
	 */
	public Integer getPalletB() {
		return palletB;
	}

	/**
	 * @param palletB the palletB to set
	 */
	public void setPalletB(Integer palletB) {
		this.palletB = palletB;
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
