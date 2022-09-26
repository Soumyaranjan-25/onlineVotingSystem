package com.ovs.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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
@ToString
@Entity
@Table(name="t_ov_user")
public class User implements Serializable {
	
	private static final long serialVersionUID = -1328258357875500508L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private Integer userId;
	
	@Column(name="registration_no")
	private String regdNo;
	
	@Column(name="student_name")
	private String userName;
	
	@Column(name="password")
	private String password;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="course_id")
	private Course course;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="branch_id")
	private Branch branch;
	
	@Column(name="dob")
	private Date dob;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="address")
	private String address;
	
	@Column(name="student_id_card")
	private String idCard;
	
	@Column(name="remark")
	private String remark;
	
	@Column(name="mobile_no")
	private String mobileNo;
	
	@Column(name="email")
	private String email;

	@Column(name="approve_status")
	private Integer approveStatus;
	
	@Column(name="approved_by")
	private Integer approveBy;
	
	@Column(name="bitstatus")
	private String bitstatus;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@Column(name="created_by_role_id")
	private Integer createdByRoleId;
	
	@Column(name="updated_on")
	private Date updatedOn;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="role_id")
	private Role role;
	
}
