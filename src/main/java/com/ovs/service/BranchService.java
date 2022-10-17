package com.ovs.service;

import java.util.List;

import com.ovs.model.Branch;

public interface BranchService {

	List<Branch> getAllBranch();

	void saveBranch(Branch branch);

	Branch getBranchById(Integer branchId);

	void deleteBranch(Integer branchId);

}
