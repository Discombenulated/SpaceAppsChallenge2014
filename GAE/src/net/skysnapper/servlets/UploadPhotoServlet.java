/**
 * 
 */
package net.skysnapper.servlets;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.services.SnapperService;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.FileInfo;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;

/**
 * @author LONJS43
 *
 */
public class UploadPhotoServlet extends HttpServlet {
	/**
	 * generated version.
	 */
	private static final long serialVersionUID = 5849138160369202006L;
	
	/**
	 * Registers Objectify classes
	 */
	static SnapperService photoPostService = SnapperService
			.getInstance();

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		String title = req.getParameter("title");

		BlobstoreService blobstoreService = BlobstoreServiceFactory
				.getBlobstoreService();

		Map<String, List<FileInfo>> blobs = blobstoreService.getFileInfos(req);

		Collection<List<FileInfo>> entries = blobs.values();

		for (List<FileInfo> filedeets : entries) {
			for (FileInfo myfileinfo : filedeets) {
				String gsFileName = myfileinfo.getGsObjectName();
				if (myfileinfo.getSize() > 0)
					photoPostService.createNewPost(title, gsFileName);
			}
		}

		resp.sendRedirect("/");
	}
}
