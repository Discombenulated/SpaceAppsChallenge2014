/**
 * 
 */
package net.skysnapper.services;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.jsr107cache.Cache;
import net.sf.jsr107cache.CacheException;
import net.sf.jsr107cache.CacheFactory;
import net.sf.jsr107cache.CacheManager;
import net.skysnapper.entity.PhotoPost;
import net.skysnapper.util.Constants;
import net.skysnapper.util.StringUtils;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.UploadOptions;
import com.google.appengine.api.memcache.jsr107cache.GCacheFactory;
import com.google.appengine.api.utils.SystemProperty;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

/**
 * @author LONJS43
 *
 */
public class SnapperService {
	private static final SnapperService _instance = new SnapperService();

	static final Map<Object, Object> cacheProps = new HashMap<Object, Object>();

	static {
		ObjectifyService.register(PhotoPost.class);

		cacheProps.put(GCacheFactory.EXPIRATION_DELTA, 5);
	}

	public static SnapperService getInstance() {
		return _instance;
	}

	public Cache getCache() {
		try {
			CacheFactory cacheFactory = CacheManager.getInstance()
					.getCacheFactory();
			return cacheFactory.createCache(cacheProps);
		} catch (CacheException e) {
		}

		return null;
	}
	
	public Iterable<PhotoPost> getAllImages() {
		return ofy().load().type(PhotoPost.class).order("-timestamp")
				.iterable();
	}

	public Key<PhotoPost> createNewPost(String filename, String takenTimestamp, String lat, String lon, String compassDegrees, String inclinationDegrees) {
		Date takenDate = null;
		Long unix = StringUtils.parseLong(takenTimestamp);
		
		if (null != unix) {
			takenDate = new Date(unix);
		}
		
		PhotoPost photoPost = new PhotoPost(filename, takenDate, lat, lon, compassDegrees, inclinationDegrees);
		return ofy().save().entity(photoPost).now();		
	}
	
	public String getPhotoUploadURL() {
		BlobstoreService blobstore = BlobstoreServiceFactory
				.getBlobstoreService();

		return blobstore
				.createUploadUrl(Constants.RelativeURLs.PHOTO_UPLOAD_CALLBACK,
						UploadOptions.Builder
						.withGoogleStorageBucketName(Constants.GCS_BUCKET));
	}
	
	public String getMobileUploadURL() {
		BlobstoreService blobstore = BlobstoreServiceFactory
				.getBlobstoreService();

		return blobstore
				.createUploadUrl(Constants.RelativeURLs.MOBILE_UPLOAD_CALLBACK,
						UploadOptions.Builder
						.withGoogleStorageBucketName(Constants.GCS_BUCKET));
	}

	public boolean isOnAppSpot() {
		return SystemProperty.environment.value() == SystemProperty.Environment.Value.Production;
	}

	public PhotoPost getPhoto(String keyString) {
		return ofy().load().type(PhotoPost.class).id(StringUtils.parseLong(keyString)).now();
	}

	public void savePhoto(PhotoPost photo) {
		ofy().save().entity(photo);
	}
}
