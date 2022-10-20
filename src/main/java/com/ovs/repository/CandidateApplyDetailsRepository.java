package com.ovs.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.CandidateApplyDetails;
import com.ovs.model.User;
@Repository
public interface CandidateApplyDetailsRepository extends JpaRepository<CandidateApplyDetails, Integer> {
	
	@Query("From CandidateApplyDetails where userId=:loginUser and bitstatus='false'")
	CandidateApplyDetails getCandidateDetailsByUser(User loginUser);

}
