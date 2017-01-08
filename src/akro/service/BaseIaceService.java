package akro.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import org.apache.lucene.queryparser.classic.ParseException;

import akro.dao.IBaseIaceDao;
import akro.entity.BaseEntity;
import akro.entity.sys.SysUser;
import core.service.BaseService;

public class BaseIaceService<T extends BaseEntity> extends BaseService<T, Long> {
	protected String luceneIndexFolder;
	
	protected IBaseIaceDao<T> dao;
	
	protected BaseIaceService(IBaseIaceDao<T> dao) {
		this.dao = dao;
		
		Properties prop = new Properties();
		try {
			prop.load(this.getClass().getClassLoader().getResourceAsStream("configs/iace.properties"));
			this.luceneIndexFolder = prop.getProperty("luceneIndexFolder");
		} catch (IOException e) {
			log.fatal("", e);
		}
	}
	
	@Override
	public T get(Long id) {
		return this.dao.get(id);
	}

	@Override
	public void create(T entity) throws IOException, SQLException {
		this.dao.create(entity);		
	}
	
	public void create(T entity, SysUser user) throws IOException, SQLException {
		if (user != null) {
			entity.setCreateUser(user.getAccount());
		}
		create(entity);
	}
	
	@Override
	public void update(T entity) throws IOException, SQLException {
		this.dao.update(entity);
	}
	
	public void update(T entity, SysUser user) throws IOException, SQLException, ParseException {
		if (user != null) {
			entity.setUpdateUser(user.getAccount());
		}
		update(entity);
	}

	@Override
	public void delete(T entity) throws IOException, SQLException {
		this.dao.delete(entity);
	}

	@Override
	public void delete(Long id) throws IOException, SQLException {
		this.dao.delete(id);
	}
	
	public List<T> listAll() {
		return this.dao.listAll();
	}
}
