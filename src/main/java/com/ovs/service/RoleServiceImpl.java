package com.ovs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.Role;
import com.ovs.repository.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public Role getRoleById(Integer roleId) {
		return roleRepository.getRoleById(roleId);
	}
	
}
