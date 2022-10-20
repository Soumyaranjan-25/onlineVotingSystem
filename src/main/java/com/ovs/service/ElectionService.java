package com.ovs.service;

import com.ovs.model.Election;

public interface ElectionService {

	Election savePostDetails(Election election);

	Election getElection();

	Integer getElectionIdByElectionName(String electionName);

	void deleteElection(Integer electionId);

	Election getElectionById(Integer electionId);

}
