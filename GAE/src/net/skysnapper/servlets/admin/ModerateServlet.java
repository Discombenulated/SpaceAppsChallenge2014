package net.skysnapper.servlets.admin;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.entity.PhotoPost;
import net.skysnapper.services.SnapperService;
import net.skysnapper.util.Constants;
import net.skysnapper.util.JSPs;

public class ModerateServlet extends HttpServlet {
	
	/**
	 * generated version.
	 */
	private static final long serialVersionUID = 5456683130284216709L;
	
	private static final Logger LOGGER = Logger.getLogger(ModerateServlet.class.getName());
	
	private static final SnapperService snapperService = SnapperService.getInstance();
	
	private static final int PHOTOS_PER_PAGE = 12;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			int maxPhotos = snapperService.countPhotos();
			int numPages = (int)Math.ceil((double)maxPhotos / (double)PHOTOS_PER_PAGE);
			
			int currentPage = 1;
			String pageStr = req.getParameter(Constants.Paging.CURRENT_PAGE);
			if (null != pageStr) {
				try {
					int myValue = Integer.parseInt(pageStr);
					if (myValue > 0 && myValue <= numPages) {
						currentPage = myValue;
					}
				} catch (Exception e) {
					//Nothing
				}
			}
			int startIndex = (currentPage - 1) * PHOTOS_PER_PAGE; 
			req.setAttribute(Constants.Attributes.PHOTOS_LIST, snapperService.getPhotos(startIndex, PHOTOS_PER_PAGE));
			req.setAttribute(Constants.Attributes.PHOTO_LIST_COLUMNS, new Integer(3));
			req.setAttribute(Constants.Paging.CURRENT_PAGE, new Integer(currentPage));
			req.setAttribute(Constants.Paging.NUM_PAGES, new Integer(numPages));
			req.getRequestDispatcher(JSPs.Admin.MODERATE).forward(req, resp);
		} catch (Exception e) {
			LOGGER.log(Level.WARNING, "Admin/Moderate Failed", e);
		}
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String[] idList = req.getParameterValues("id");
			
			SnapperService ss = SnapperService.getInstance();
			
			for (int i = 0; i < idList.length; i++) {
				PhotoPost photo = ss.getPhoto(idList[i]);
				if (null != photo) {
					String isModeratedStr = req.getParameter("isModeratorApproved$" + photo.getId());
					Boolean isModerated = ("on".equals(isModeratedStr));
					if (photo.getIsModeratorApproved() != isModerated) {
						photo.setIsModeratorApproved(isModerated);
						ss.savePhoto(photo);
					}
				}
			}
			
			resp.sendRedirect("/admin/moderate");
		} catch (Exception e) {
			LOGGER.log(Level.WARNING, "Admin/Moderate Failed", e);
		}
	}
}
