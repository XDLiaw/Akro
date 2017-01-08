package akro.entity;

public class BaseSearchModel {

	private int pageIndex;
	private int pageSize;
	
	public BaseSearchModel() {
		this.pageIndex = 0;
		this.pageSize = 20;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
