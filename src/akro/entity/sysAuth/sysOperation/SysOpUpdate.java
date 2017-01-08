package akro.entity.sysAuth.sysOperation;

public class SysOpUpdate extends SysOp {

	public SysOpUpdate() {
		super.displayName = "編輯";
		super.actions.add("update");
		super.actions.add("updateSubmit");	
	}

}
