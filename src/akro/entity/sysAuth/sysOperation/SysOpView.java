package akro.entity.sysAuth.sysOperation;

public class SysOpView extends SysOp {

	public SysOpView() {
		super.displayName = "瀏覽";
		super.actions.add("init");
		super.actions.add("index");
		super.actions.add("showDetail");
		super.actions.add("printReport");
		super.actions.add("exportRawData");
		super.actions.add("downloadQnrLinksExcel");
		super.actions.add("downloadUnfillQnrLinksExcel");
		super.actions.add("downloadQnrResultExcel");
		super.actions.add("downloadImage");
		super.actions.add("downloadVideo");
		super.actions.add("downloadAttach");
	}

}
