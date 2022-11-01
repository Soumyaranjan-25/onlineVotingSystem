package com.ovs.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
@Table(name="t_ov_candidate_vote")
public class CandidateVoteDetails implements Serializable {
	private static final long serialVersionUID = 9;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="candidate_vote_id")
	private Integer candidateVoteId;
	
	@ManyToOne
	@JoinColumn(name="post_id")
	private Post post;
	
	@ManyToOne
	@JoinColumn(name="election_id")
	private Election election;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@Column(name="vote_date")
	private Date votingDate;


}
