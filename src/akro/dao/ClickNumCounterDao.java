package akro.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import akro.HibernateSessionFactory;

public class ClickNumCounterDao {

	public int increaseClickNum(long id, Class<?> cls) {
		// check is class has field [clickNum]
		try {
			cls.getDeclaredField("clickNum");
		} catch (NoSuchFieldException | SecurityException e) {
			return 0;
		}
		
		Transaction tran = null;
		try {
			Session session = HibernateSessionFactory.getSession();
			tran = session.beginTransaction();
			String hql = "UPDATE " + cls.getSimpleName()
					+ " SET clickNum = (clickNum + 1) " 
					+ " WHERE id = :id";
			Query query = session.createQuery(hql);
			query.setLong("id", id);
			int result = query.executeUpdate();
			tran.commit();
			return result;
		} catch (Exception e) {
			if (tran != null) {
				tran.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
}
