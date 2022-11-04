package com.ovs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.CandidateVoteDetails;

@Repository
public interface CandidateVoteDetailsRepository extends JpaRepository<CandidateVoteDetails, Integer> {

	@Query("From CandidateVoteDetails c where c.user.userId=:userId and c.election.electionId=:electionId")
	List<CandidateVoteDetails> getCandidateVoteDetailsByUserId(Integer userId, Integer electionId);

}
