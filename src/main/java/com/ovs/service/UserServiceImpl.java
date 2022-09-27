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
	public User saveUser(User user, User previousUser) {
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
		if (previousUser != null) {
			if (user.getCreatedOn() == null) {
				user.setCreatedOn(previousUser.getCreatedOn());
			}
			if (user.getUpdatedOn() == null) {
				user.setUpdatedOn(previousUser.getUpdatedOn());
			}
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

	@Override
	public void deleteByUserId(Integer userId) {
		userRepository.deleteByUserId(userId);

	}

	@Override
	public List<User> getUserByApproveStatus(Integer approveStatus) {
		return userRepository.getUserByApproveStatus(approveStatus);
	}

	@Override
	public void saveUser(User user) {
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

		userRepository.save(user);

	}
}
