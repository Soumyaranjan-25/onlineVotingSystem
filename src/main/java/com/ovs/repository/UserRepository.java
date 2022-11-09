package com.ovs.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.User;
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	@Query("FROM User where bitstatus='false' and createdByRoleId=1")
	List<User> getAllUserByAdmin();

	@Query("FROM User where userName=:userName and password=:password and bitstatus='false'")
	User getUserByUserName(String userName,String password);
	
	@Query("FROM User u where u.bitstatus='false' and u.role.roleId=2")
	List<User> getAllUser();

	@Query("FROM User where userId=:userId")
	User getUserByUserId(Integer userId);
	
	@Query("select idCard FROM User where userId=:userId")
	String getUseridCardByUserId(Integer userId);
	
	@Transactional
	@Modifying
	@Query("UPDATE User set bitstatus='true' where userId=:userId")
	void deleteByUserId(Integer userId);

	@Query("FROM User where bitstatus='false' and approveStatus=:approveStatus")
	List<User> getUserByApproveStatus(Integer approveStatus);

	@Query("SELECT COUNT(*) FROM User u where u.bitstatus='false' and u.role.roleId=2")
	Integer getUserCount();

}
