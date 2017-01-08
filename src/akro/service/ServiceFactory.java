package akro.service;

import akro.dao.DaoFactory;
import akro.service.sys.SysRoleService;
import akro.service.sys.SysUserService;

public class ServiceFactory {
	private static SysRoleService sysRoleService;
	private static SysUserService sysUserService;

	// =========================================================================

	public static SysRoleService getSysRoleService() {
		if (sysRoleService == null) {
			sysRoleService = new SysRoleService(DaoFactory.getSysRoleDao());
		}
		return sysRoleService;
	}

	public static SysUserService getSysUserService() {
		if (sysUserService == null) {
			sysUserService = new SysUserService(DaoFactory.getSysUserDao());
		}
		return sysUserService;
	}

}
