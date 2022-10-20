package com.ovs.service;

import java.util.List;

import com.ovs.model.Post;

public interface PostService {

	List<Post> getAllPost();

	Post getPostById(Integer postId);

	
}
