package org.paulvargas.greek.rs;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.paulvargas.greek.ejb.GreekEJB;
import org.paulvargas.tools.util.ClassLoaderUtil;

/**
 * 
 * @author @paul-vargas
 */
@Path("greek")
@Stateless
public class GreekResource {

	private static final Logger LOG = Logger.getLogger(GreekResource.class.getName());

	@EJB
	private GreekEJB greekEJB;

	private static void copy(InputStream source, OutputStream target) throws IOException {
		byte[] buffer = new byte[8192];
		for (int n; (n = source.read(buffer)) > 0;) {
			target.write(buffer, 0, n);
		}
	}

	@GET
	public void getHome(@Context HttpServletRequest request, @Context HttpServletResponse response, @Context ServletContext context) {
		try {
			request.getRequestDispatcher("/WEB-INF/pages/greek/home.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			LOG.log(Level.SEVERE, "There was an error getting the greek's home.", e);
		}
	}

	@GET
	@Path("verses/{book}/{chapter}")
	@Produces({MediaType.APPLICATION_JSON})
	public List<Map<String, Object>> getFullChapter(@PathParam("book") int book, @PathParam("chapter") int chapter) {
		return greekEJB.getFullChapter(book, chapter);
	}

	@GET
	@Path("assets/{folder}/{filename : .*}")
	public void getAsset(@Context HttpServletRequest request, @Context HttpServletResponse response, @Context ServletContext context, @PathParam("folder") String folder, @PathParam("filename") String filename) {
		try {
			InputStream source = ClassLoaderUtil.getResourceAsStream("org/paulvargas/greek/resources/" + folder + "/" + filename, this.getClass());
			if (source != null) {
				//CacheControlFilter.setCacheHeaders(response, 31104000); // 1 year
				switch (folder) { // image/png, application/javascript, text/css, image/svg+xml, application/javascript; charset=utf-8, image/gif
					case "css":
						response.setContentType("text/css");
						break;
					case "js":
						response.setContentType("application/javascript");
						break;
					case "fonts":
						response.setContentType("application/font-woff");
						break;
					default:
						break;
				}
				ServletOutputStream target = response.getOutputStream();
				copy(source, target);
				target.flush();
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
		} catch (IOException e) {
			LOG.log(Level.SEVERE, "There was an error getting the stylesheet.", e);
		}
	}
	
	@GET
	@Path("assets/js/custom.js")
	public void getCustomJs(@Context HttpServletRequest request, @Context HttpServletResponse response, @Context ServletContext context) {
		try {
			request.getRequestDispatcher("/WEB-INF/pages/greek/custom.js.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			LOG.log(Level.SEVERE, "There was an error getting the greek's custom.js", e);
		}
	}	

}
