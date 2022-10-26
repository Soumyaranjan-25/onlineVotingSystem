package com.ovs.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.CandidateApplyDetails;
import com.ovs.model.User;
@Repository
public interface CandidateApplyDetailsRepository extends JpaRepository<CandidateApplyDetails, Integer> {
	
	@Query("From CandidateApplyDetails where userId=:loginUser and bitstatus='false'")
	CandidateApplyDetails getCandidateDetailsByUser(User loginUser);

	@Transactional
	@Modifying
	@Query("UPDATE CandidateApplyDetails set bitstatus='true' where candidateApplyId=:candidateApplyId")
	void deleteAppliedPost(Integer candidateApplyId);
	
	@Transactional
	@Modifying
	@Query("UPDATE CandidateApplyDetails set candidateStatus=:candidateStatus where candidateApplyId=:candidateApplyId")
	void updateCandidateStatus(Integer candidateApplyId,Integer candidateStatus );

	@Query("From CandidateApplyDetails where candidateStatus=0 and bitstatus='false'")
	List<CandidateApplyDetails> getCandidateApplyDetails();

	@Query("From CandidateApplyDetails c where c.candidateStatus=1 and c.bitstatus='false' order by c.postId.postId")
	List<CandidateApplyDetails> getApprovedCandidateApplyDetails();

	@Transactional
	@Modifying
	@Query("UPDATE CandidateApplyDetails c set c.bitstatus='true' where c.election.electionId=:electionId")
	void deleteCandidateDetailsByElectionId(Integer electionId);


}
