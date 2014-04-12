package net.skysnapper.servlets;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.util.JSPs;

public class HomeServlet extends HttpServlet {
	
	/**
	 * generated version.
	 */
	private static final long serialVersionUID = 5456686170284216609L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.getRequestDispatcher(JSPs.HOME).forward(req, resp);
			
		} catch (Exception e) {
			
		}
	}

}
