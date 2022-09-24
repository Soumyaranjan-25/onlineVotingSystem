package com.ovs.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.User;
import com.ovs.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleService roleService;

	@Override
	public User saveUser(User user) {
		Date topday=new Date();
		user.setApproveStatus(0);
		user.setApproveBy(1);
		user.setBitstatus("false");
		user.setRole(roleService.getRoleById(2));
		System.out.println(user.getUserId());
		if(user.getUserId() == null ) {
			user.setCreatedOn(topday);
		}
		else {
			user.setUpdatedOn(topday);
		}
		return userRepository.save(user);
	}
}
