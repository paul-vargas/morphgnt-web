package org.paulvargas.greek.rs;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

@Path("greek")
@Stateless
public class GreekResource {

	private static final Logger LOG = Logger.getLogger(GreekResource.class.getName());

	@GET
	public void getHome(@Context HttpServletRequest request, @Context HttpServletResponse response, @Context ServletContext context) {
		try {
			request.getRequestDispatcher("/WEB-INF/pages/greek/home.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			LOG.log(Level.SEVERE, "There was an error getting the greek's home.", e);
		}
	}

}
