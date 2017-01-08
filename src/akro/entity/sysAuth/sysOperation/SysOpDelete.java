package akro.entity.sysAuth.sysOperation;

public class SysOpDelete extends SysOp {

	public SysOpDelete() {
		super.displayName = "刪除";
		super.actions.add("delete");
		super.actions.add("deleteSubmit");	
	}

}
