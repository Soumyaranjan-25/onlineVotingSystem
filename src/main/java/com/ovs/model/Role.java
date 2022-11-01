package com.ovs.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@Entity
@Table(name="t_ov_role")
public class Role implements Serializable {
	private static final long serialVersionUID = 4;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="role_id")
	private Integer roleId;
	@Column(name="role_name")
	private String roleName;
	@Column(name="alias_name")
	private String aliasName;
	@Column(name="remark")
	private String remark;
	@Column(name="created_on")
	private Date createdOn;
	@Column(name="created_by")
	private Integer createdBy;
	@Column(name="updated_on")
	private Date updatedOn;
	@Column(name="updated_by")
	private Integer updatedBy;
	@Column(name="bitstatus")
	private String bitstatus;
}
