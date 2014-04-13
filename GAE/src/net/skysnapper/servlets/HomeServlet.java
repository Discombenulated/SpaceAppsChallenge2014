package net.skysnapper.servlets;

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
	private static final long serialVersionUID = 5456686170284216609L;
	
	private static final SnapperService snapperService = SnapperService.getInstance();
	
	private static final Logger LOGGER = Logger.getLogger(HomeServlet.class.getName());

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setAttribute(Constants.Attributes.PHOTOS_LIST, snapperService.getLatestPhotos(2));
			req.getRequestDispatcher(JSPs.HOME).forward(req, resp);
		} catch (Exception e) {
			LOGGER.log(Level.WARNING, "HomePage Failed", e);
		}
	}

}
