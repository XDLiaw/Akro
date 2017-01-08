package akro.dao.sys;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import akro.HibernateSessionFactory;
import akro.dao.BaseIaceDao;
import akro.entity.sys.SysUser;
import akro.entity.sys.SysUserSearchModel;
import core.util.PagedList;

public class SysUserDao extends BaseIaceDao<SysUser> implements ISysUserDao {

	public SysUserDao() {
		super(SysUser.class);
	}

	@Override
	public SysUser get(long id) {
		try {
			Session session = HibernateSessionFactory.getSession();
			Criteria criteria = session.createCriteria(SysUser.class);
			criteria.add(Restrictions.eq("id", id));
			criteria.add(Restrictions.eq("isValid", true));
			SysUser user = (SysUser) criteria.uniqueResult();
			Hibernate.initialize(user);
			Hibernate.initialize(user.getSysRole());
			
			return user;
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}	
	}
	
	@Override
	public SysUser getBy(String account, String password) {
		try {
			Session session = HibernateSessionFactory.getSession();
			Criteria criteria = session.createCriteria(SysUser.class);
			criteria.add(Restrictions.eq("account", account));
			criteria.add(Restrictions.eq("password", password));
			criteria.add(Restrictions.eq("isValid", true));
			SysUser user = (SysUser) criteria.uniqueResult();
			if (user != null) {
				Hibernate.initialize(user);
				Hibernate.initialize(user.getSysRole());
			}
			
			return user;
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}	
	}

	@Override
	public boolean isExist(String account, String password) {
		try {
			Session session = HibernateSessionFactory.getSession();
			Criteria criteria = session.createCriteria(SysUser.class);
			criteria.add(Restrictions.eq("account", account));
			criteria.add(Restrictions.eq("password", password));
			criteria.add(Restrictions.eq("isValid", true));
			criteria.setProjection(Projections.rowCount());
			Long count = (Long) criteria.uniqueResult();
			return count > 0;
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}	
	}

	@Override
	public boolean isAccountExist(String account) {
		try {
			Session session = HibernateSessionFactory.getSession();
			Criteria criteria = session.createCriteria(SysUser.class);
			criteria.add(Restrictions.eq("account", account));
			criteria.add(Restrictions.eq("isValid", true));
			criteria.setProjection(Projections.rowCount());
			Long count = (Long) criteria.uniqueResult();
			return count > 0;
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}	
	}

	@Override
	public PagedList<SysUser> searchBy(SysUserSearchModel arg) {
		long totalItemCount = queryTotalRecordsCount(arg);
		PagedList<SysUser> results = new PagedList<SysUser>(totalItemCount, arg.getPageSize(), arg.getPageIndex());
		try {
			Session session = HibernateSessionFactory.getSession();
			Criteria criteria = session.createCriteria(super.entityClass);
			addCriteriaRestrictionsForSearch(arg, criteria);
			criteria.addOrder(Order.asc("id"));
			
			criteria.setFirstResult(results.getItemStart()-1);
			criteria.setMaxResults(arg.getPageSize());
			
			@SuppressWarnings("unchecked")
			List<SysUser> list = criteria.list();
			results.setList(list);
			return results;
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public long queryTotalRecordsCount(SysUserSearchModel arg) {
		try {
			Session session = HibernateSessionFactory.getSession();
			Criteria criteria = session.createCriteria(super.entityClass);
			addCriteriaRestrictionsForSearch(arg, criteria);

			criteria.setProjection(Projections.rowCount());
			Object count = criteria.uniqueResult();
			return (long) count;
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	private void addCriteriaRestrictionsForSearch(SysUserSearchModel arg, Criteria criteria) {
		if (StringUtils.isNotBlank(arg.getSearchText())) {
			Disjunction or = Restrictions.disjunction();
			or.add(Restrictions.like("account", arg.getSearchText(), MatchMode.START).ignoreCase());
			or.add(Restrictions.like("name", arg.getSearchText(), MatchMode.START).ignoreCase());
			criteria.add(or);
		}
		if (arg.getSysRoleId() != null && arg.getSysRoleId() > 0) {
			criteria.add(Restrictions.eq("sysRole.id", arg.getSysRoleId()));
		}
		criteria.add(Restrictions.eq("isValid", true));
	}

}
