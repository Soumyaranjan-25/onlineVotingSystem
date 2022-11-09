package com.ovs.service;

import java.util.List;

import com.ovs.model.CandidateApplyDetails;
import com.ovs.model.User;

public interface CandidateApplyDetailsService {

	void saveCandidateApply(CandidateApplyDetails candidateApplyDetails);

	CandidateApplyDetails getCandidateDetailsByUser(User loginUser);

	void deleteAppliedPost(Integer candidateApplyId);

	void candidateApproved(Integer candidateApplyId);

	void candidateDiscard(Integer candidateApplyId);

	List<CandidateApplyDetails> getCandidateApplyDetails();

	List<CandidateApplyDetails> getApprovedCandidateApplyDetails();

	void deleteCandidateDetailsByElectionId(Integer electionId);

	CandidateApplyDetails getCandidateApplyDetailsById(Integer candidateApplyId);

	List<CandidateApplyDetails> getApprovedCandidateApplyDetailsByPostId(Integer postId);

}
