package com.ovs.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
//@ToString
@Entity
@Table(name="t_ov_branch")
public class Branch implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="branch_id")
	private Integer branchId;
	@Column(name="branch_name")
	private String branchName;
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name="course_id")
	private Course course;
	@Column(name="remark")
	private String remark;
	@Column(name="bitstatus")
	private String bitstatus;
	@Column(name="created_on")
	private Date createdOn;
	@Column(name="updated_on")
	private Date updatedOn;
	@Column(name="created_by")
	private Integer createdBy;
	@Column(name="updated_by")
	private Integer updatedBy;
	
	
	
}
