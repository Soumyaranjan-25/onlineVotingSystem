package com.ovs.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.Branch;
@Repository
public interface BranchRepository extends JpaRepository<Branch, Integer> {
	@Query("From Branch where bitstatus='false'")
	List<Branch> getAllBranch();

	@Query("From Branch where  branchId=:branchId")
	Branch getBranchById(Integer branchId);

	@Transactional
	@Modifying
	@Query("Update Branch set bitstatus='true' where branchId=:branchId")
	void deleteBranch(Integer branchId);

}
