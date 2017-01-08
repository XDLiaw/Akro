package akro.entity.sys;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;

import akro.entity.BaseEntity;
import akro.entity.sysAuth.SysAuth;

@Entity
@Table(name = "SYS_ROLE")
public class SysRole extends BaseEntity {

	private static final long serialVersionUID = -868106738545265052L;
	private long id;
	private String name;
	
	private String authJsonString;
	private transient SysAuth sysAuth = new SysAuth();
	
	@Id
	@Column(name = "ID", length = 19, unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_SYS_ROLE_ID")
	@SequenceGenerator(name = "SEQUENCE_SYS_ROLE_ID", sequenceName = "SEQUENCE_SYS_ROLE_ID", allocationSize = 1, initialValue = 1)
	public long getId() {
		return id;
	}

	public void setId(long roleId) {
		this.id = roleId;
	}

	@Column(name = "NAME", length = 100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "AUTH_JSON_STRING")
	public String getAuthJsonString() {
		return this.authJsonString;
	}

	public void setAuthJsonString(String authJsonString) {
		this.authJsonString = authJsonString;
		fromJsonString();
	}

	@Transient
	public SysAuth getSysAuth() {
		return sysAuth;
	}

	private void toJsonString() {
		this.authJsonString = this.sysAuth.toJsonString();
	}

	private void fromJsonString() {
		if (StringUtils.isNotBlank(this.authJsonString)) {
			this.sysAuth = SysAuth.fromJsonString(this.authJsonString);
		}
	}

	@Override
	public void create() {
		toJsonString();
		super.create();
	}

	@Override
	public void update() {
		toJsonString();
		super.update();
	}
	
	
}
