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

@Getter
@Setter
@Entity
@Table(name="t_ov_candidate_apply")
public class CandidateApplyDetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="candidate_apply_id")
	private Integer candidateApplyId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User userId;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="post_id")
	private Post postId;
	
	@Column(name="bitstatus")
	private String bitstatus;
	@Column(name="apply_on")
	private Date applyOn;
	
	@Column(name="candidate_status")
	private Integer candidateStatus;
}
