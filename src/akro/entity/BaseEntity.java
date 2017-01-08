package akro.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;
import javax.persistence.Version;

import org.hibernate.annotations.Type;

import com.opensymphony.xwork2.conversion.annotations.TypeConversion;

@MappedSuperclass
public abstract class BaseEntity implements Serializable {

	private static final long serialVersionUID = 5908489787919929004L;

	private Boolean isValid;
	private Timestamp createTime;
	private String createUser;
	private Timestamp updateTime;
	private String updateUser;
	private Timestamp ver;
	
	public BaseEntity() {}
	
	public BaseEntity(BaseEntity entity) {
		this.isValid = entity.isValid;
		this.createTime = entity.createTime;
		this.createUser = entity.createUser;
		this.updateTime = entity.updateTime;
		this.updateUser = entity.updateUser;
		this.ver = entity.ver;
	}
	
	@Transient
	public abstract long getId();
	

	
	@Column(name = "IS_VALID")
	@Type(type="true_false")
	public Boolean getIsValid() {
		return isValid;
	}

	public void setIsValid(Boolean isValid) {
		this.isValid = isValid;
	}

	@Column(name = "CREATE_TIME")
	@TypeConversion(converter="iace.converter.StringToTimestampConverter")
//	@Temporal(TemporalType.TIMESTAMP)
	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	@Column(name = "CREATE_USER", length=100)	
	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	@Column(name = "UPDATE_TIME")
	@TypeConversion(converter="iace.converter.StringToTimestampConverter")
//	@Temporal(TemporalType.TIMESTAMP)
	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "UPDATE_USER", length=100)
	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	@Version
	@Column(name = "VER", nullable = false)
	@TypeConversion(converter="iace.converter.StringToTimestampConverter")
	public Timestamp getVer() {
		return ver;
	}

	public void setVer(Timestamp ver) {
		this.ver = ver;
	}

	@Override
	public String toString() {
		return "BaseEntity [isValid=" + isValid + ", createTime=" + createTime + ", createUser=" + createUser + ", updateTime=" + updateTime + ", updateUser=" + updateUser + ", ver=" + ver + "]";
	}

	public void create() {
		Timestamp now = new Timestamp(System.currentTimeMillis());
		if (this.createTime == null) {
			this.createTime = now;
		}
		if (this.updateTime == null) {
			this.updateTime = now;
		}
		this.isValid = true;
	}
	
	public void update() {
		Timestamp now = new Timestamp(System.currentTimeMillis());
		this.updateTime = now;
	}
	
	public void delete() {
		update();
		this.isValid = false;
	}
	
	public String toSysLog() {
		return "";
	}
	

}
