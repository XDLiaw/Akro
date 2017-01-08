package akro.entity;

import java.util.ArrayList;
import java.util.List;

public class BaseBatchImportResult <T> {

	private List<T> insertList = new ArrayList<T>();
	private List<T> updateList = new ArrayList<T>();
	private List<String> errMsgs = new ArrayList<String>();

	public List<T> getInsertList() {
		return insertList;
	}

	public void setInsertList(List<T> insertList) {
		this.insertList = insertList;
	}
	
	public void addRecordToInsertList(T record) {
		this.insertList.add(record);
	}

	public List<T> getUpdateList() {
		return updateList;
	}

	public void setUpdateList(List<T> updateList) {
		this.updateList = updateList;
	}
	
	public void addRecordToUpdateList(T record) {
		this.updateList.add(record);
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
