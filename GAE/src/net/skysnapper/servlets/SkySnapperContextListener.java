/**
 * 
 */
package net.skysnapper.servlets;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import net.skysnapper.services.SnapperService;

/**
 * @author LONJS43
 *
 */
public class SkySnapperContextListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent context) {
	}

	@Override
	public void contextInitialized(ServletContextEvent context) {
		// this initialises objectify
		SnapperService.getInstance();
	}
}
