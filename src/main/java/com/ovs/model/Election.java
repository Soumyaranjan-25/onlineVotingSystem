package com.ovs.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@Entity
@Table(name="t_ov_election_details")
public class Election implements Serializable {
	
	private static final long serialVersionUID = 7;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="election_id")
	private Integer electionId;
	
	@Column(name="election_name")
	private String electionName;
	
	@Column(name="election_year")
	private String electionYear;
	
	@Column(name="remark")
	private String remark;
	
	@Column(name="bitstatus")
	private String bitstatus;
	
	@Column(name="start_date")
	private Date startDate;
	
	@Column(name="end_date")
	private Date endDate;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "election")
    private List<PostDetails> postDetails;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "election")
    private List<CandidateApplyDetails> candidateApplyDetails;
	
	@Column(name="election_status")
	private Integer electionStatus;
}
