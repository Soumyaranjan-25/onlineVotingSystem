package com.ovs.service;

import com.ovs.model.Election;

public interface ElectionService {

	Election saveElectionDetails(Election election);

	Election getElection();

	Integer getElectionIdByElectionName(String electionName);

	void deleteElection(Integer electionId);

	Election getElectionById(Integer electionId);

	Election getOngoingElection();

	void startElection(Integer electionId);

	Election getLatestElection();

}
