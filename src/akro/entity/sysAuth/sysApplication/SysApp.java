package akro.entity.sysAuth.sysApplication;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import akro.entity.sysAuth.sysOperation.SysOp;

public abstract class SysApp {

	protected transient String displayName;
	protected transient List<String> namespaces = new ArrayList<String>();

	public String getDisplayName() {
		return displayName;
	}
	
	public List<String> getNamespaces() {
		return namespaces;
	}
	
	public abstract Set<SysOp> getOperationSet();
	
	public boolean hasEnableNamespace(String namespace) {
		if (this.namespaces.contains(namespace)) {
			for (SysOp op : getOperationSet()) {
				if (op.isAuth()) {
					return true;
				}
			}
		}
		return false;
	}
	
	public boolean hasEnableNamespaceStartWith(String namespace) {
		for (String sp : this.namespaces) {
			if (sp.startsWith(namespace)) {
				for (SysOp op : getOperationSet()) {
					if (op.isAuth()) {
						return true;
					}
				}
			}
		}
		return false;
	}

	public boolean hasAuth(String namespace, String action) {
		if (this.namespaces.contains(namespace)) {
			for (SysOp op : getOperationSet()) {
				if (op.hasAction(action)) {
					return op.isAuth();
				}
			}
		}
		return false;
	}

}
