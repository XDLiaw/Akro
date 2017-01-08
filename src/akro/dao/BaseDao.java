package akro.dao;


import java.io.Serializable;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
//import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import akro.HibernateSessionFactory;

public abstract class BaseDao<T> {
	protected static Logger log = LogManager.getLogger(BaseDao.class);
//	protected static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(BaseDao.class);
	
	/**
	 * different between load() and get(), 
	 * please see "http://www.mkyong.com/hibernate/different-between-session-get-and-session-load/"
	 */
	protected Object load(Class<?> cla, Serializable id) {
		Object object = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			object = session.load(cla, id);
			session.clear();
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return object;
	}
	
	protected Object get(Class<?> cla, Serializable id) {
		Object object = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			object = session.get(cla, id);
			session.clear();
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return object;
	}

	protected void create(T entity) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			tran = session.beginTransaction();
			session.save(entity);
			tran.commit();
		} catch (HibernateException e) {
			if (tran != null) {
				tran.rollback();
			}
			throw e;
		} finally {
//			session.close();
			HibernateSessionFactory.closeSession();
		}
	}

	protected void delete(T entity) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			tran = session.beginTransaction();
			session.delete(entity);
			tran.commit();
		} catch (HibernateException e) {
			if (tran != null) {
				tran.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	protected void update(T entity) {
		Transaction tran = null;
		Session session = HibernateSessionFactory.getSession();
		try {
			tran = session.beginTransaction();
			session.update(entity);
			tran.commit();
		} catch (HibernateException e) {
			if (tran != null) {
				tran.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	protected List<?> listAll(Class<?> cla) {
		Session session = HibernateSessionFactory.getSession();
		try {
			List<?> entityList = session.createCriteria(cla).list();
			return entityList;
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	protected List<?> listAll(Class<?> cla, List<Order> orderList, List<Criterion> criterionList) {
		Session session = HibernateSessionFactory.getSession();
		try {
			Criteria criteria = session.createCriteria(cla);
			for (Criterion c : criterionList) {
				criteria.add(c);
			}			
			for (Order order : orderList) {
				criteria.addOrder(order);
			}
			List<?> entityList = criteria.list();
			return entityList;
		} catch (HibernateException e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
}
