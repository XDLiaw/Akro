package akro.entity.sysAuth.sysOperation;

public class SysOpBatchImport extends SysOp {

	public SysOpBatchImport() {
		super.displayName = "批次匯入";
		super.actions.add("batchImport");
		super.actions.add("batchImportSubmit");
		super.actions.add("downloadBatchSample");
	}

}
