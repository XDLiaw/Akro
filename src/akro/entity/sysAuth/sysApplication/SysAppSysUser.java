package akro.entity.sysAuth.sysApplication;

import java.util.HashSet;
import java.util.Set;

import akro.entity.sysAuth.sysOperation.SysOp;
import akro.entity.sysAuth.sysOperation.SysOpCreate;
import akro.entity.sysAuth.sysOperation.SysOpUpdate;
import akro.entity.sysAuth.sysOperation.SysOpView;

public class SysAppSysUser extends SysApp {
	private SysOpView opView = new SysOpView();
	private SysOpCreate opCreate = new SysOpCreate();
	private SysOpUpdate opUpdate = new SysOpUpdate();
	
	public SysAppSysUser() {
		super.displayName = "系統使用者";
		super.namespaces.add("/sysUser");
	}
	
	@Override
	public Set<SysOp> getOperationSet() {
		Set<SysOp> operations = new HashSet<SysOp>();
		operations.add(this.opView);
		operations.add(this.opCreate);
		operations.add(this.opUpdate);
		return operations;
	}

	public SysOpView getOpView() {
		return opView;
	}

	public SysOpCreate getOpCreate() {
		return opCreate;
	}

	public SysOpUpdate getOpUpdate() {
		return opUpdate;
	}

}
