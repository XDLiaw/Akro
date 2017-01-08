package akro.entity.sysAuth.sysOperation;

import java.util.ArrayList;
import java.util.List;

public class SysOp {
	protected boolean auth = false;
	protected transient String displayName;
	protected transient List<String> actions = new ArrayList<String>();

	public boolean isAuth() {
		return auth;
	}

	public void setAuth(boolean auth) {
		this.auth = auth;
	}

	public String getDisplayName() {
		return displayName;
	}

	public boolean hasAction(String action) {
		return this.actions.contains(action);
	}
}
