/**
 * 
 */
package net.skysnapper.servlets;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.entity.PhotoPost;
import net.skysnapper.services.SnapperService;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.FileInfo;
import com.googlecode.objectify.Key;

/**
 * @author LONJS43
 *
 */
public class UploadPhotoServlet extends HttpServlet {
	/**
	 * generated version.
	 */
	private static final long serialVersionUID = 5849138160369202006L;
	
	private static final Logger LOGGER = Logger.getLogger(UploadPhotoServlet.class.getName());
	
	/**
	 * Registers Objectify classes
	 */
	static SnapperService snapperService = SnapperService
			.getInstance();

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		String takenTimestamp = req.getParameter("takenTimestamp");
		String lat = req.getParameter("lat");
		String lon = req.getParameter("lon");
		String compassDegrees = req.getParameter("compassDegrees");
		String inclinationDegrees = req.getParameter("inclinationDegrees");

		BlobstoreService blobstoreService = BlobstoreServiceFactory
				.getBlobstoreService();

		Map<String, List<FileInfo>> blobs = blobstoreService.getFileInfos(req);

		Collection<List<FileInfo>> entries = blobs.values();

		LOGGER.info("BLOBS: " + entries.size());
		
		Key<PhotoPost> photoPostKey = null;
		
		for (List<FileInfo> filedeets : entries) {
			for (FileInfo myfileinfo : filedeets) {
				String gsFileName = myfileinfo.getGsObjectName();
				LOGGER.info(gsFileName);
				if (myfileinfo.getSize() > 0) {
					photoPostKey = snapperService.createNewPost(gsFileName, takenTimestamp, lat, lon, compassDegrees, inclinationDegrees);
				}
			}
		}

		postUpload(req, resp, photoPostKey);
	}

	protected void postUpload(HttpServletRequest req, HttpServletResponse resp, Key<PhotoPost> photoPostKey) throws IOException {
		resp.sendRedirect("/");
	}
}
