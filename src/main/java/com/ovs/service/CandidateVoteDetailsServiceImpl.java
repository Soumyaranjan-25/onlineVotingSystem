package com.ovs.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.CandidateApplyDetails;
import com.ovs.model.CandidateVoteDetails;
import com.ovs.model.User;
import com.ovs.repository.CandidateVoteDetailsRepository;

@Service
public class CandidateVoteDetailsServiceImpl implements CandidateVoteDetailsService {

	@Autowired
	private CandidateApplyDetailsService candidateApplyDetailsService;
	
	@Autowired
	private CandidateVoteDetailsRepository candidateVoteDetailsRepository;
	
	@Override
	public void saveCandidateVote(Integer candidateApplyId, User loginUser) {
		CandidateApplyDetails candidate=candidateApplyDetailsService.getCandidateApplyDetailsById(candidateApplyId);
		CandidateVoteDetails candidateVoteDetails=new CandidateVoteDetails();
		candidateVoteDetails.setCandidate_id(candidate.getUserId());
		candidateVoteDetails.setElection(candidate.getElection());
		candidateVoteDetails.setPost(candidate.getPostId());
		candidateVoteDetails.setUser(loginUser);
		candidateVoteDetails.setVotingDate(new Date());
		candidateVoteDetailsRepository.save(candidateVoteDetails); 
	}

	@Override
	public List<CandidateVoteDetails> getCandidateVoteDetailsByUserId(Integer userId,Integer electionId) {
		return candidateVoteDetailsRepository.getCandidateVoteDetailsByUserId(userId,electionId);
	}

}
