package com.ovs.service;

import java.util.List;

import com.ovs.model.CandidateVoteDetails;
import com.ovs.model.User;

public interface CandidateVoteDetailsService {

	void saveCandidateVote(Integer candidateApplyId, User loginUser);

	List<CandidateVoteDetails> getCandidateVoteDetailsByUserId(Integer userId, Integer electionId);

	Integer getCandidateVoteDetailsByElectionId(Integer electionId);

	Integer getCandidateVoteDetailsByPostIdAndElectionId(Integer postId, Integer electionId, Integer userId);

}
