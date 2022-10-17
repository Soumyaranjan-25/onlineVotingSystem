package com.ovs.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.Election;
import com.ovs.repository.ElectionRepository;

@Service
public class ElectionServiceImpl implements ElectionService {
	@Autowired
	private ElectionRepository electionRepository;

	@Override
	public Election savePostDetails(Election election) {
		election.setBitstatus("false");
		election.setStartDate(new Date());
		return electionRepository.save(election);
	}

	@Override
	public Election getElection() {
		List<Election> activeElection =electionRepository.getActiveElection();
//		if()
		return electionRepository.getActiveElection().get(0);
	}

	@Override
	public Integer getElectionIdByElectionName(String electionName) {
		return electionRepository.getElectionIdByElectionName(electionName);
	}

	@Override
	public void deleteElection(Integer electionId) {
		electionRepository.deleteElection(electionId);
	}
}
