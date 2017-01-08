package akro.dao.option;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import akro.HibernateSessionFactory;
import akro.dao.BaseDao;
import akro.entity.option.BaseOption;
import akro.entity.option.BaseOptionSearchModel;
import core.util.PagedList;


public abstract class BaseOptionDao<OptionEntity extends BaseOption> extends BaseDao<OptionEntity> implements IOptionDao<OptionEntity> {
	private static boolean realDelete = true;
	
	protected Class<OptionEntity> optionEntityClass;
	
	protected BaseOptionDao(Class<OptionEntity> optionEntityClass) {
		this.optionEntityClass = optionEntityClass;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public OptionEntity getByCode(String code) {
		try {
			Session session = HibernateSessionFactory.getSession();
			String hql = "FROM " + optionEntityClass.getSimpleName() +" o "
					+ "WHERE o.code = :code AND o.isValid = :isValid";
			Query query = session.createQuery(hql);
			query.setString("code", code);
			query.setBoolean("isValid", true);
			Object obj = query.uniqueResult();
			return (OptionEntity)obj;
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OptionEntity> listAll() {
		List<Criterion> criterionList = new ArrayList<Criterion>();
		criterionList.add(Restrictions.eq("isValid", true));	
		List<Order> orderList = new ArrayList<Order>();
		orderList.add(Order.asc("priority"));
		orderList.add(Order.asc("code"));
		return (List<OptionEntity>) super.listAll(optionEntityClass, orderList, criterionList);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OptionEntity> listNotIn(List<String> codes) {
		List<Criterion> criterionList = new ArrayList<Criterion>();
		if (codes != null && codes.size() > 0) {
			criterionList.add(Restrictions.not(Restrictions.in("code", codes)));
		}
		criterionList.add(Restrictions.eq("isValid", true));
		List<Order> orderList = new ArrayList<Order>();
		orderList.add(Order.asc("priority"));
		orderList.add(Order.asc("code"));
		return (List<OptionEntity>) super.listAll(optionEntityClass, orderList, criterionList);
	}
	
	@Override
	public List<String> listAllCode() {
		try {
			Session session = HibernateSessionFactory.getSession();
			String hql = "SELECT code "
					+ "FROM " + this.optionEntityClass.getSimpleName() + " o "
					+ "WHERE o.isValid = :isValid";
			Query query = session.createQuery(hql);
			query.setBoolean("isValid", true);
			@SuppressWarnings("unchecked")
			List<String> codeList = query.list();
			return codeList;			
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public Map<String, OptionEntity> mapAll() {
		List<OptionEntity> list = listAll();
		Map<String, OptionEntity> map = new LinkedHashMap<String, OptionEntity>();
		list.forEach(v -> map.put(v.getCode(), v));
		return map;
	}
	
	@Override
	public PagedList<OptionEntity> searchBy(BaseOptionSearchModel args) {
		try {
			long totalItemCount = queryTotalRecordsCount(args);
			PagedList<OptionEntity> results = new PagedList<OptionEntity>(totalItemCount, args.getPageSize(), args.getPageIndex());
			
			Session session = HibernateSessionFactory.getSession();
			Criteria criteria = session.createCriteria(this.optionEntityClass);
			addCriteriaRestrictionsForSearch(args, criteria);
			criteria.addOrder(Order.asc("priority"));	
			criteria.addOrder(Order.asc("code"));			
			criteria.setFirstResult(results.getItemStart()-1);
			criteria.setMaxResults(args.getPageSize());
			
			@SuppressWarnings("unchecked")
			List<OptionEntity> list = criteria.list();
			results.setList(list);
			return results;
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	private long queryTotalRecordsCount(BaseOptionSearchModel args) {
		try {
			Session session = HibernateSessionFactory.getSession();
			Criteria criteria = session.createCriteria(this.optionEntityClass);
			addCriteriaRestrictionsForSearch(args, criteria);
			criteria.setProjection(Projections.rowCount());
			Object count = criteria.uniqueResult();
			return (long) count;
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	private void addCriteriaRestrictionsForSearch(BaseOptionSearchModel args, Criteria criteria) {
		if (StringUtils.isNotBlank(args.getSearchText())) {
			Disjunction or = Restrictions.disjunction();
			or.add(Restrictions.like("code", args.getSearchText(), MatchMode.START).ignoreCase());
			or.add(Restrictions.like("name", args.getSearchText(), MatchMode.ANYWHERE).ignoreCase());			
			criteria.add(or);
		}
		
		criteria.add(Restrictions.eq("isValid", true));
	}

	@SuppressWarnings("unchecked")
	public OptionEntity get(long id) {
		return (OptionEntity) super.get(optionEntityClass, id);
	}	
	
	@Override
	public void create(OptionEntity entity) {
		entity.create();
		super.create(entity);
	}
	
	@Override
	public void createAll(List<OptionEntity> entities) {
		Transaction tran = null;
		try {
			Session session = HibernateSessionFactory.getSession();
			tran = session.beginTransaction();
			for (int i = 0; i < entities.size(); i++) {
				entities.get(i).create();
				session.save(entities.get(i));
				if (i % 100 == 0) {
					session.flush();
				}
			}
			tran.commit();			
		} catch (Exception e) {
			if (tran != null) {
				tran.rollback();
			}
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public void update(OptionEntity entity) {
		entity.update();
		super.update(entity);
	}
	
	@Deprecated
	@Override
	public void updateAll(List<OptionEntity> entities) {
		// TODO Auto-generated method stub
	}
	
	@Override
	public void delete(OptionEntity entity) {
		if (entity == null) {
			throw new IllegalArgumentException("無法刪除不存在的資料！");
		}
		if (realDelete) {			
			super.delete(entity);	
		} else {
			entity.delete();
			super.update(entity);
		}
	}
	
	@Override
	public void delete(long id) {
		OptionEntity entity = get(id);
		delete(entity);		
	}
	
	public boolean isCodeExist(String code) {
		try {
			if (StringUtils.isNotBlank(code)) {
				Session session = HibernateSessionFactory.getSession();
				String hql = "SELECT count(*) "
						+ "FROM " + this.optionEntityClass.getSimpleName() + " o "
						+ "WHERE o.code = :code AND o.isValid = :isValid";
				Query query = session.createQuery(hql);
				query.setString("code", code);
				query.setBoolean("isValid", true);
				Object obj = query.uniqueResult();
				return (long)obj >= 1;			
			} else {
				throw new IllegalArgumentException("[code] can't be null or blank");
			}	
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	
	public boolean isNameExist(String name) {
		try {
			if (StringUtils.isNotBlank(name)) {
				Session session = HibernateSessionFactory.getSession();
				String hql = "SELECT count(*) "
						+ "FROM " + this.optionEntityClass.getSimpleName() + " o "
						+ "WHERE o.name = :name AND o.isValid = :isValid";
				Query query = session.createQuery(hql);
				query.setString("name", name);
				query.setBoolean("isValid", true);
				Object obj = query.uniqueResult();
				return (long)obj >= 1;			
			} else {
				throw new IllegalArgumentException("[name] can't be null or blank");
			}	
		} catch (Exception e) {
			throw e;
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}

	@Override
	public boolean hasBeenUsed(OptionEntity entity) {
		return hasBeenUsed(entity.getId());
	}
}
