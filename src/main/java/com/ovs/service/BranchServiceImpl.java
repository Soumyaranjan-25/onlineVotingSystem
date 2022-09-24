package com.ovs.service;

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

}
