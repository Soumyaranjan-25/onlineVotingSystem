package com.ovs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.User;
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	@Query("FROM User where bitstatus='false' and createdByRoleId=1")
	List<User> getAllUserByAdmin();

	@Query("FROM User where userName=:userName and password=:password and bitstatus='false'")
	User getUserByUserName(String userName,String password);
	
	@Query("FROM User where bitstatus='false'")
	List<User> getAllUser();

	@Query("FROM User where userId=:userId")
	User getUserByUserId(Integer userId);

}
