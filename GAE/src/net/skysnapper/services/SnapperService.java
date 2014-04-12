/**
 * 
 */
package net.skysnapper.services;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.HashMap;
import java.util.Map;

import net.sf.jsr107cache.Cache;
import net.sf.jsr107cache.CacheException;
import net.sf.jsr107cache.CacheFactory;
import net.sf.jsr107cache.CacheManager;
import net.skysnapper.entity.PhotoPost;

import com.google.appengine.api.memcache.jsr107cache.GCacheFactory;
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
		return ofy().load().type(PhotoPost.class).order("timestamp")
				.iterable();
	}

	public void createNewPost(String title, String filename) {
		PhotoPost photoPost = new PhotoPost(title, filename);
		ofy().save().entity(photoPost);		
	}
}
