package com.ovs.service;


import java.util.List;

import com.ovs.model.User;

public interface UserService {

	User saveUser(User user);

	User getUserByUserName(String userName, String password);

	List<User> getAllUser();
}
