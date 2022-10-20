package com.ovs.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.Post;
@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {

	@Query("FROM Post where bitstatus='false'")
	List<Post> getAllPost();

	@Query("FROM Post where postId=:postId")
	Post getPostById(Integer postId);

}
