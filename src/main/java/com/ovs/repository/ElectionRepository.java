package com.ovs.repository;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.Election;
@Repository
public interface ElectionRepository extends JpaRepository<Election, Integer> {

	@Query("From Election where bitstatus='false'")
	List<Election> getActiveElection();

	@Query("Select electionId From Election where bitstatus='false' and electionName=:electionName")
	Integer getElectionIdByElectionName(String electionName);

	@Transactional
	@Modifying
	@Query("Update Election set bitstatus='true' where electionId=:electionId")
	void deleteElection(Integer electionId);

	@Query("From Election where electionId=:electionId and bitstatus='false'")
	Election getElectionById(Integer electionId);

	@Query("From Election where bitstatus='false'")
	Election getOngoingElection();

	@Transactional
	@Modifying
	@Query("Update Election set electionStatus=1 where electionId=:electionId")
	void changeElectionStatus(Integer electionId);
	
	@Transactional
	@Modifying
	@Query("Update Election set endDate=:date, electionStatus=2 where electionId=:electionId")
	void updateEndDate(Integer electionId, Date date);

	@Query("FROM Election WHERE electionId=(SELECT max(electionId) FROM Election)")
	Election getLatestElection();

}
