package org.paulvargas.greek.ejb;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.type.StandardBasicTypes;

@Stateless
public class GreekEJB {

	private static final Logger LOG = Logger.getLogger(GreekEJB.class.getName());

	@PersistenceContext
	private EntityManager em;

	public List<Map<String, Object>> getFullChapter(int book, int chapter) {
		final String sql = "SELECT v, CONCAT(sp, cd) spcd, t1, t4 FROM words WHERE b = :book AND c = :chapter ORDER BY id, v";
		Session session = em.unwrap(Session.class);
		SQLQuery sqlQuery = session.createSQLQuery(sql)
				.addScalar("v", StandardBasicTypes.INTEGER)
				.addScalar("spcd", StandardBasicTypes.STRING)
				.addScalar("t1", StandardBasicTypes.STRING)
				.addScalar("t4", StandardBasicTypes.STRING);
		sqlQuery.setInteger("book", book)
				.setInteger("chapter", chapter)
				.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
		List<Map<String, Object>> list = sqlQuery.list();
		return list;
	}

}
