package akro.dao.sys;

import akro.dao.IBaseIaceDao;
import akro.entity.sys.SysUser;
import akro.entity.sys.SysUserSearchModel;
import core.util.PagedList;

public interface ISysUserDao extends IBaseIaceDao<SysUser> {

	public SysUser getBy(String account, String password);
	
	public boolean isExist(String account, String password);
	
	public boolean isAccountExist(String account);
	
	public PagedList<SysUser> searchBy(SysUserSearchModel arg);
	
	public long queryTotalRecordsCount(SysUserSearchModel arg);
}
