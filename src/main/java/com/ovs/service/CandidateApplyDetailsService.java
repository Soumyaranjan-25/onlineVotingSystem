package com.ovs.service;

import com.ovs.model.CandidateApplyDetails;
import com.ovs.model.User;

public interface CandidateApplyDetailsService {

	void saveCandidateApply(CandidateApplyDetails candidateApplyDetails);

	CandidateApplyDetails getCandidateDetailsByUser(User loginUser);

}
