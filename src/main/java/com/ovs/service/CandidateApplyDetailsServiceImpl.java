package com.ovs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.CandidateApplyDetails;
import com.ovs.model.User;
import com.ovs.repository.CandidateApplyDetailsRepository;

@Service
public class CandidateApplyDetailsServiceImpl implements CandidateApplyDetailsService {
	@Autowired
	private CandidateApplyDetailsRepository candidateApplyDetailsRepository;
	
	@Override
	public void saveCandidateApply(CandidateApplyDetails candidateApplyDetails) {
		System.out.println(candidateApplyDetails);
		candidateApplyDetailsRepository.save(candidateApplyDetails);
	}

	@Override
	public CandidateApplyDetails getCandidateDetailsByUser(User loginUser) {
		return candidateApplyDetailsRepository.getCandidateDetailsByUser(loginUser);
	}

	@Override
	public void deleteAppliedPost(Integer candidateApplyId) {
		candidateApplyDetailsRepository.deleteAppliedPost(candidateApplyId);		
	}

	@Override
	public void candidateApproved(Integer candidateApplyId) {
		candidateApplyDetailsRepository.updateCandidateStatus(candidateApplyId,1);
	}

	@Override
	public void candidateDiscard(Integer candidateApplyId) {
		candidateApplyDetailsRepository.updateCandidateStatus(candidateApplyId,2);
		candidateApplyDetailsRepository.deleteAppliedPost(candidateApplyId);
	}

	@Override
	public List<CandidateApplyDetails> getCandidateApplyDetails() {
		return candidateApplyDetailsRepository.getCandidateApplyDetails();
	}

	@Override
	public List<CandidateApplyDetails> getApprovedCandidateApplyDetails() {
		return candidateApplyDetailsRepository.getApprovedCandidateApplyDetails();
	}

	@Override
	public void deleteCandidateDetailsByElectionId(Integer electionId) {
		candidateApplyDetailsRepository.deleteCandidateDetailsByElectionId(electionId);
	}

	@Override
	public CandidateApplyDetails getCandidateApplyDetailsById(Integer candidateApplyId) {
		return candidateApplyDetailsRepository.getByCandidateId(candidateApplyId);
	}

	@Override
	public List<CandidateApplyDetails> getApprovedCandidateApplyDetailsByPostId(Integer postId) {
		return candidateApplyDetailsRepository.getApprovedCandidateApplyDetailsByPostId(postId);
	}

	
}
