package akro.service.sys;

import akro.dao.sys.ISysUserDao;
import akro.entity.sys.SysUser;
import akro.entity.sys.SysUserSearchModel;
import akro.service.BaseIaceService;
import core.util.PagedList;

public class SysUserService extends BaseIaceService<SysUser> {
	
	private ISysUserDao dao;
	
	public SysUserService(ISysUserDao dao) {
		super(dao);
		this.dao = dao;
	}

	public boolean loginCheck(String account, String password) {
		return this.dao.isExist(account, password);
	}
	
	public SysUser getBy(String account, String password) {
		return this.dao.getBy(account, password);
	}
	
	public PagedList<SysUser> searchBy(SysUserSearchModel arg) {
		return this.dao.searchBy(arg);
	}
}
