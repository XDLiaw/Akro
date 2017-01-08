package core.util;

import java.util.ArrayList;
import java.util.List;

public class PagedList<E> {

	/** 總頁數 */
	private int pageCount;

	/** 會比pageNumber少1 [0 ~ pageCount-1] */
	private int pageIndex;
	
	/** 現在頁數  [1 ~ pageCount] */
	private int pageNumber;
	
	/** 每頁資料筆數 */
	private int pageSize;
	
	private boolean isFirstPage;
	private boolean isLastPage;
	
	/** 總資料筆數 */
	private long totatlItemCount;
	
	/** 本頁第一筆資料編號 (第一頁第一筆資料為1, 最後一頁最後一筆資料為totatlItemCount)*/
	private int itemStart;
	
	/** 本頁最後一筆資料編號 */
	private int itemEnd;

	private List<E> list;
	private List<Integer> pageNumberList;
	
	public PagedList(long totalItemCount, int pageSize, int pageIndex) {		
		if (totalItemCount < 0) {
			throw new IllegalArgumentException("[totalItemCount] can't be smaller than 0");
		}
		this.totatlItemCount = totalItemCount;
		if (pageSize < 1) {
			throw new IllegalArgumentException("[pageSize] can't be smaller than 1");
		}
		this.pageSize = pageSize;
		this.pageCount = (int) Math.ceil(this.totatlItemCount/(double)this.pageSize);
		if (pageIndex < 0 || (pageCount > 0 && pageIndex > pageCount-1)) {
			throw new IndexOutOfBoundsException("[pageIndex] out of bounds");
		}
		this.pageIndex = pageIndex;
		this.pageNumber = pageIndex + 1;
		this.pageNumberList = new ArrayList<Integer>();
		for (int i=1;i<=this.pageCount;i++) {
			this.pageNumberList.add(i);
		}
		this.isFirstPage = this.pageNumber == 1;
		this.isLastPage = this.pageNumber == this.pageCount;
		this.itemStart = this.pageIndex * this.pageSize + 1 ;
		this.itemEnd = this.pageNumber * this.pageSize;
	}
	
	public PagedList(List<E> list, long totalItemCount, int pageSize, int pageIndex) {
		this(totalItemCount, pageSize, pageIndex);
		this.list = list;
	}

	public int getPageCount() {
		return pageCount;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public boolean isFirstPage() {
		return isFirstPage;
	}

	public boolean isLastPage() {
		return isLastPage;
	}

	public long getTotatlItemCount() {
		return totatlItemCount;
	}

	public int getItemStart() {
		return itemStart;
	}

	public int getItemEnd() {
		return itemEnd;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public List<Integer> getPageNumberList() {
		return pageNumberList;
	}

	

	
}
