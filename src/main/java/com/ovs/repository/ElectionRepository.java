package com.ovs.repository;

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

}
