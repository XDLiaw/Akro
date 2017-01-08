package akro.entity.sysAuth.sysOperation;

public class SysOpCreate extends SysOp {

	public SysOpCreate() {
		super.displayName = "新增";
		super.actions.add("create");
		super.actions.add("createSubmit");
	}

}
