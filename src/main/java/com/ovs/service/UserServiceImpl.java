package com.ovs.service;

import java.util.Date;
import java.util.List;

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
		Date topday = new Date();
		if (user.getCreatedByRoleId() == 1) {
			user.setApproveStatus(1);
		} else {
			user.setApproveStatus(0);
		}
		user.setBitstatus("false");
		user.setRole(roleService.getRoleById(2));
		if (user.getUserId() == null) {
			user.setCreatedOn(topday);
		} else {
			user.setUpdatedOn(topday);
		}
		return userRepository.save(user);
	}

	@Override
	public User getUserByUserName(String userName, String password) {
		return userRepository.getUserByUserName(userName, password);
	}

	@Override
	public List<User> getAllUser() {
		return userRepository.getAllUser();
	}

	@Override
	public List<User> getAllUserByAdmin() {
		return userRepository.getAllUserByAdmin();
	}

	@Override
	public User getUserByUserId(Integer userId) {
		return userRepository.getUserByUserId(userId);
	}
}
