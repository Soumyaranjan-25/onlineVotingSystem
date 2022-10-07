package com.ovs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.PostDetails;
import com.ovs.repository.PostDetailsRepository;

@Service
public class PostDetailsServiceImpl implements PostDetailsService {
	@Autowired
	private PostDetailsRepository postDetailsRepository;

	@Override
	public void savePostDetails(PostDetails postDetails) {
		postDetails.setBitstatus("false");
		postDetailsRepository.save(postDetails);
	}

	@Override
	public List<PostDetails> getAllPostDetails() {
		return postDetailsRepository.getAllPostDetails();
	}

	@Override
	public PostDetails getPostDetailsById(Integer postDetailsId) {
		return postDetailsRepository.getPostDetailsById(postDetailsId);
	}

	@Override
	public void deletepostDetails(Integer postDetailsId) {
		postDetailsRepository.deletepostDetails(postDetailsId);
	}

	@Override
	public void updateElection(Integer electionId) {
		postDetailsRepository.updateElection(electionId);
	}

	@Override
	public void deletepostDetailsByElectionId(Integer electionId) {
		postDetailsRepository.deletepostDetailsByElectionId(electionId);
	}
}
