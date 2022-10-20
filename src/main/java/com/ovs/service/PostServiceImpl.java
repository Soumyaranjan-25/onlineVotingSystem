package com.ovs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.Post;
import com.ovs.model.PostDetails;
import com.ovs.repository.PostRepository;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostRepository postRepository;

	@Override
	public List<Post> getAllPost() {
		return postRepository.getAllPost();
	}

	@Override
	public Post getPostById(Integer postId) {
		return postRepository.getPostById(postId);
	}

	
}
