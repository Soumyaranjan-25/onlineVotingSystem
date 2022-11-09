package com.ovs.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.PostDetails;
@Repository
public interface PostDetailsRepository extends JpaRepository<PostDetails, Integer> {
	
	@Query("FROM PostDetails where bitstatus='false'")
	List<PostDetails> getAllPostDetails();

	@Query("FROM PostDetails where bitstatus='false' and postDetailsId=:postDetailsId")
	PostDetails getPostDetailsById(Integer postDetailsId);

	@Transactional
	@Modifying
	@Query("UPDATE PostDetails set bitstatus='true' where postDetailsId=:postDetailsId")
	void deletepostDetails(Integer postDetailsId);

	@Transactional
	@Modifying
	@Query("UPDATE PostDetails set election_id=:electionId where bitstatus='false'")
	void updateElection(Integer electionId);

	@Transactional
	@Modifying
	@Query("UPDATE PostDetails set bitstatus='true' where election_id=:electionId")
	void deletepostDetailsByElectionId(Integer electionId);

	
	@Transactional
	@Modifying
	@Query("UPDATE PostDetails set winningUser.userId=:userId ,winnerVotingPercentage=:winningPercentage   where election_id=:electionId and post.postId=:postId")
	void updateWinningDetails(Integer electionId, Integer userId, Double winningPercentage, Integer postId);

}
