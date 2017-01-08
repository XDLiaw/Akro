package akro.entity.option;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "OPT_SYS_NAMESPACE")
public class OptionSysNamespace extends BaseOption {

	private static final long serialVersionUID = 8482376184065823590L;

//	private List<OptionSysAction> sysActionList = new ArrayList<OptionSysAction>();
//
//	@OneToMany(mappedBy = "optionSysNamespace", fetch = FetchType.EAGER)
//	@Fetch(FetchMode.SUBSELECT)
//	public List<OptionSysAction> getSysActionList() {
//		return sysActionList;
//	}
//
//	public void setSysActionList(List<OptionSysAction> sysActionList) {
//		this.sysActionList = sysActionList;
//	}
	
	
}
