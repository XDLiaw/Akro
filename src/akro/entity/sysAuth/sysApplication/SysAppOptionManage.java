package akro.entity.sysAuth.sysApplication;

import java.util.HashSet;
import java.util.Set;

import akro.entity.sysAuth.sysOperation.SysOp;
import akro.entity.sysAuth.sysOperation.SysOpBatchImport;
import akro.entity.sysAuth.sysOperation.SysOpCreate;
import akro.entity.sysAuth.sysOperation.SysOpDelete;
import akro.entity.sysAuth.sysOperation.SysOpUpdate;
import akro.entity.sysAuth.sysOperation.SysOpView;

public class SysAppOptionManage extends SysApp {
	private SysOpView opView = new SysOpView();
	private SysOpCreate opCreate = new SysOpCreate();
	private SysOpUpdate opUpdate = new SysOpUpdate();
	private SysOpDelete opDelete = new SysOpDelete();
	private SysOpBatchImport opBatchImport = new SysOpBatchImport(); 
	
	public SysAppOptionManage() {
		super.displayName = "代碼管理";
		super.namespaces.add("/option/companyLocation");
		super.namespaces.add("/option/consult");
		super.namespaces.add("/option/cooperateMode");
		super.namespaces.add("/option/country");
		super.namespaces.add("/option/grbDomain");
		super.namespaces.add("/option/hadTecSrc");
		super.namespaces.add("/option/hrst");
		super.namespaces.add("/option/industry");
		super.namespaces.add("/option/domain");
		super.namespaces.add("/option/organizationClass");
		super.namespaces.add("/option/organizationType");
		super.namespaces.add("/option/subject");
		super.namespaces.add("/option/trl");
		super.namespaces.add("/option/school");
		super.namespaces.add("/option/sysNamespace");
		super.namespaces.add("/option/sysAction");
	}

	@Override
	public Set<SysOp> getOperationSet() {
		Set<SysOp> operations = new HashSet<SysOp>();
		operations.add(this.opView);
		operations.add(this.opCreate);
		operations.add(this.opUpdate);
		operations.add(this.opDelete);
		operations.add(this.opBatchImport);
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

	public SysOpDelete getOpDelete() {
		return opDelete;
	}

	public SysOpBatchImport getOpBatchImport() {
		return opBatchImport;
	}

	
}
