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
	public Election saveElectionDetails(Election election) {
		election.setBitstatus("false");
		election.setStartDate(new Date());
		election.setElectionStatus(0);
		return electionRepository.save(election);
	}

	@Override
	public Election getElection() {
		List<Election> activeElection =electionRepository.getActiveElection();
		if(activeElection.size() != 0) {
			return activeElection.get(0);
		}
		else {
			return null;
		}
	}

	@Override
	public Integer getElectionIdByElectionName(String electionName) {
		return electionRepository.getElectionIdByElectionName(electionName);
	}

	@Override
	public void deleteElection(Integer electionId) {
		Date date=new Date();
		electionRepository.updateEndDate(electionId,date);
		electionRepository.deleteElection(electionId);
	}

	@Override
	public Election getElectionById(Integer electionId) {
		return electionRepository.getElectionById(electionId);
	}

	@Override
	public Election getOngoingElection() {
		return electionRepository.getOngoingElection();
	}

	@Override
	public void startElection(Integer electionId) {
		electionRepository.changeElectionStatus(electionId);
	}

	@Override
	public Election getLatestElection() {
		return electionRepository.getLatestElection();
	}
}
