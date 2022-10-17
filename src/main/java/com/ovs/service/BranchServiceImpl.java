package com.ovs.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.Branch;
import com.ovs.repository.BranchRepository;

@Service
public class BranchServiceImpl implements BranchService {
	@Autowired
	private BranchRepository branchRepository;
	
	@Override
	public List<Branch> getAllBranch() {
		return branchRepository.getAllBranch();
	}

	@Override
	public void saveBranch(Branch branch) {
		Date today=new Date();
		branch.setBitstatus("false");
		if(branch.getBranchId() != null) {
			branch.setUpdatedBy(1);
			branch.setUpdatedOn(today);
		}
		else {
			branch.setCreatedBy(1);
			branch.setCreatedOn(today);
		}
		branchRepository.save(branch);
	}

	@Override
	public Branch getBranchById(Integer branchId) {
		return branchRepository.getBranchById(branchId);
	}

	@Override
	public void deleteBranch(Integer branchId) {
		branchRepository.deleteBranch(branchId);
	}

}
