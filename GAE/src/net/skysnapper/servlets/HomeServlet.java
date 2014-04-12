package net.skysnapper.servlets;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.skysnapper.util.JSPs;

public class HomeServlet extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			
			req.getRequestDispatcher(JSPs.HOME).forward(req, resp);
			
		} catch (Exception e) {
			
		}
	}

}
