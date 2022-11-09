package com.ovs.service;


import java.util.List;


import com.ovs.model.User;

public interface UserService {

	User saveUser(User user,User PreviousUser);

	User getUserByUserName(String userName, String password);

	List<User> getAllUser();

	List<User> getAllUserByAdmin();

	User getUserByUserId(Integer userId);

	void deleteByUserId(Integer userId);

	List<User> getUserByApproveStatus(Integer approveStatus);

	void saveUser(User user);

	Integer getUserCount();
}
