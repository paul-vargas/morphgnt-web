package org.paulvargas.root.rs;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

import org.paulvargas.greek.rs.GreekResource;

/**
 * 
 * @author @paul-vargas
 */
@ApplicationPath("rest")
public class MyApplication extends Application {

	@Override
	public Set<Class<?>> getClasses() {
		Set<Class<?>> set = new HashSet<>();
		set.add(GreekResource.class);
		return set;
	}

}
