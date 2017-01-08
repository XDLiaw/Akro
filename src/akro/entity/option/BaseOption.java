package akro.entity.option;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import akro.entity.BaseEntity;

@MappedSuperclass
public class BaseOption  extends BaseEntity {

	private static final long serialVersionUID = -6693566207871210805L;

	private long id;
	private String name;
	private String code;
	private Float priority;
	
	public BaseOption() { }
	
	public BaseOption(String code, String name) {
		this.code = code;
		this.name = name;
	}

	@Id
	@Column(name = "ID", length = 19, unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_OPTION_ID")
	@SequenceGenerator(name = "SEQUENCE_OPTION_ID", sequenceName = "SEQUENCE_OPTION_ID", allocationSize = 1, initialValue = 1)
	public long getId() {
		return id;
	}

	public void setId(long optionCompanyLocationId) {
		this.id = optionCompanyLocationId;
	}
	
	@Column(name = "NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "CODE")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name = "PRIORITY")
	public Float getPriority() {
		return priority;
	}

	public void setPriority(Float priority) {
		this.priority = priority;
	}
	
	public void setPriority(Double priority) {
		this.priority = priority.floatValue();
	}

	@Override
	public String toString() {
		return "[name=" + name + ", code=" + code + "]";
	}
	
	@Transient
	public String getShowString() {
		return this.code+":"+this.name;
	}

	@Override
	public String toSysLog() {
		return this.code+"-"+this.name;
	}

	








	
	

}
