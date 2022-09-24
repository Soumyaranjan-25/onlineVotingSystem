package com.ovs.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.Role;
@Repository
public interface RoleRepository extends JpaRepository<Role, Integer> {
	@Query("FROM Role where roleId=:roleId")
	Role getRoleById(Integer roleId);

}
