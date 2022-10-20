package com.ovs.service;

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

	
}
