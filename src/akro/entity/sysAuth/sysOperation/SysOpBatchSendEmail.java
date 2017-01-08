package akro.entity.sysAuth.sysOperation;

public class SysOpBatchSendEmail extends SysOp {

	public SysOpBatchSendEmail() {
		super.displayName = "批次發信";
		super.actions.add("sendEmail");
		super.actions.add("sendEmailSubmit");
	}

}
