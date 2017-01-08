package akro.entity.sysAuth.sysApplication;

import java.util.HashSet;
import java.util.Set;

import akro.entity.sysAuth.sysOperation.SysOp;
import akro.entity.sysAuth.sysOperation.SysOpBatchSendEmail;

public class SysAppBatchSendEmail extends SysApp {
	private SysOpBatchSendEmail opBatchSendEmail = new SysOpBatchSendEmail();
	
	public SysAppBatchSendEmail() {
		super.displayName = "批次發送郵件";
		super.namespaces.add("/batchSendEmail");
	}

	@Override
	public Set<SysOp> getOperationSet() {
		Set<SysOp> operations = new HashSet<SysOp>();
		operations.add(this.opBatchSendEmail);
		return operations;
	}

	public SysOpBatchSendEmail getOpBatchSendEmail() {
		return opBatchSendEmail;
	}
	
}
