package net.skysnapper.servlets;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.util.JSPs;

public class ColoursOfTheSkyServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8597662501248730742L;
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.getRequestDispatcher(JSPs.COLOURS).forward(req, resp);
		} catch (Exception e) {
		}
	}

}
