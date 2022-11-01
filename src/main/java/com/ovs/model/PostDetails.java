package com.ovs.model;

import java.io.Serializable;

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
@Getter
@Setter
@Entity
@Table(name="t_ov_post_details")
public class PostDetails implements Serializable {

	private static final long serialVersionUID = 6;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="post_details_id")
	private Integer postDetailsId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="post_id")
	private Post post;
	
	@Column(name="no_of_candidate")
	private Integer noOfCandidate;
	
	@Column(name="remarks")
	private String remark;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="election_id")
	private Election election;
	
	@Column(name="bitstatus")
	private String bitstatus;
}
