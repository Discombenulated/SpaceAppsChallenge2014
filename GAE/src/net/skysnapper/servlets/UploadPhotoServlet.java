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

import net.skysnapper.services.SnapperService;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.FileInfo;

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

		String title = req.getParameter("title");

		BlobstoreService blobstoreService = BlobstoreServiceFactory
				.getBlobstoreService();

		Map<String, List<FileInfo>> blobs = blobstoreService.getFileInfos(req);

		Collection<List<FileInfo>> entries = blobs.values();

		LOGGER.info("BLOBS: " + entries.size());
		
		for (List<FileInfo> filedeets : entries) {
			for (FileInfo myfileinfo : filedeets) {
				String gsFileName = myfileinfo.getGsObjectName();
				LOGGER.info(gsFileName);
				if (myfileinfo.getSize() > 0)
					snapperService.createNewPost(title, gsFileName);
			}
		}

		resp.sendRedirect("/");
	}
}
