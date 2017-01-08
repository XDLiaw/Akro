package akro.entity.option;

import java.util.ArrayList;
import java.util.List;

public class BatchImportOptionResult {
	
	private List<BaseOption> newOptions = new ArrayList<BaseOption>();
	private List<BaseOption> updateOptions = new ArrayList<BaseOption>();
	private List<String> errMsgs = new ArrayList<String>();
	
	public List<BaseOption> getNewOptions() {
		return newOptions;
	}

	public void setNewOptions(List<BaseOption> newOptions) {
		this.newOptions = newOptions;
	}
	
	public void addNewOption(BaseOption option) {
		this.newOptions.add(option);
	}

	public List<BaseOption> getUpdateOptions() {
		return updateOptions;
	}

	public void setUpdateOptions(List<BaseOption> updateOptions) {
		this.updateOptions = updateOptions;
	}
	
	public void addUpdateOption(BaseOption option) {
		this.updateOptions.add(option);
	}

	public List<String> getErrMsgs() {
		return errMsgs;
	}

	public void setErrMsgs(List<String> errMsgs) {
		this.errMsgs = errMsgs;
	}

	public void addErrMsg(String msg) {
		this.errMsgs.add(msg);
	}
}
