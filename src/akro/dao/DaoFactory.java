package akro.dao;

import akro.dao.sys.ISysRoleDao;
import akro.dao.sys.ISysUserDao;
import akro.dao.sys.SysRoleDao;
import akro.dao.sys.SysUserDao;

public class DaoFactory {
	
	private static ISysRoleDao sysRoleDao;
	private static ISysUserDao sysUserDao;
	
	public static ISysRoleDao getSysRoleDao() {
		if (sysRoleDao == null) {
			sysRoleDao = new SysRoleDao();
		}
		return sysRoleDao;
	}
	
	public static ISysUserDao getSysUserDao() {
		if (sysUserDao == null) {
			sysUserDao = new SysUserDao();
		}
		return sysUserDao;
	}

}
