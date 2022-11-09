package com.ovs.service;

import java.util.List;

import com.ovs.model.PostDetails;

public interface PostDetailsService {

	void savePostDetails(PostDetails postDetails);

	List<PostDetails> getAllPostDetails();

	PostDetails getPostDetailsById(Integer postDetailsId);

	void deletepostDetails(Integer postDetailsId);

	void updateElection(Integer electionId);

	void deletepostDetailsByElectionId(Integer electionId);

	void updateWinningDetails(Integer electionId);


}
