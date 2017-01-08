package akro.entity.sys;

import akro.entity.BaseSearchModel;

public class SysUserSearchModel extends BaseSearchModel {
	private String searchText;
	private Long sysRoleId;

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public Long getSysRoleId() {
		return sysRoleId;
	}

	public void setSysRoleId(Long sysRoleId) {
		this.sysRoleId = sysRoleId;
	}

}
