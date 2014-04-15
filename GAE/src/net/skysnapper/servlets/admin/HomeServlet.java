package net.skysnapper.servlets.admin;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.services.SnapperService;
import net.skysnapper.util.Constants;
import net.skysnapper.util.JSPs;

public class HomeServlet extends HttpServlet {
	
	/**
	 * generated version.
	 */
	private static final long serialVersionUID = 5456686170284216709L;
	
	private static final Logger LOGGER = Logger.getLogger(HomeServlet.class.getName());
	
	private static final SnapperService snapperService = SnapperService.getInstance();

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setAttribute(Constants.Attributes.PHOTOS_LIST, snapperService.getPhotos(0, 6));
			req.setAttribute(Constants.Attributes.PHOTO_LIST_COLUMNS, new Integer(2));
			req.setAttribute(Constants.Paging.CURRENT_PAGE, new Integer(1));
			req.setAttribute(Constants.Paging.NUM_PAGES, new Integer(1));
			req.getRequestDispatcher(JSPs.Admin.HOME).forward(req, resp);
		} catch (Exception e) {
			LOGGER.log(Level.WARNING, "Admin/HomePage Failed", e);
		}
	}
}
