package akro.service.sys;

import akro.dao.sys.ISysRoleDao;
import akro.entity.sys.SysRole;
import akro.service.BaseIaceService;

public class SysRoleService extends BaseIaceService<SysRole> {
	
	public SysRoleService(ISysRoleDao dao) {
		super(dao);
	}

	@Override
	public SysRole get(Long id) {
		SysRole role = super.get(id);
		return role;
	}
}
