package org.paulvargas.root.filter;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omnifaces.filter.HttpFilter;

/**
 * Servlet Filter implementation class MyFilter
 */
@WebFilter("/*")
public class MyFilter extends HttpFilter {

	private static final Logger LOG = Logger.getLogger(MyFilter.class.getName());


	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, HttpSession session, FilterChain chain) throws ServletException, IOException {

		// Log to file
		String country = request.getHeader("CF-IPCountry");
		String from = request.getHeader("CF-Connecting-IP");
		if (from == null) {
			from = request.getRemoteAddr();
		}
		StringBuffer requestURL = request.getRequestURL();
		if (LOG.isLoggable(Level.INFO)) {
			LOG.log(Level.INFO, "From <{2} {4}> {0} \"{1}\" with \"{3}\"", new Object[] { request.getMethod(), requestURL, from, request.getHeader("User-Agent"), country});
		}

		// Redirect if applies
		if (!request.getRequestURI().replaceFirst(Pattern.quote(request.getContextPath()), "").equals("/") && requestURL.charAt(requestURL.length() - 1) == '/') {
			response.sendRedirect(requestURL.substring(0, requestURL.length() - 1));
		} else {
			chain.doFilter(request, response);
		}
	}

}
