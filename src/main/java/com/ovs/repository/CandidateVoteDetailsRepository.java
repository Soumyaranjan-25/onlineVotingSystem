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

	@Query("SELECT count(distinct user) From CandidateVoteDetails c where c.election.electionId=:electionId")
	Integer countByElectionId(Integer electionId);

	@Query("SELECT count(*) From CandidateVoteDetails c where c.election.electionId=:electionId and c.candidate_id.userId=:userId and c.post.postId=:postId")
	Integer getCandidateVoteDetailsByPostIdAndUserId(Integer postId, Integer electionId, Integer userId);

}
