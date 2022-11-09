package com.ovs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.CandidateApplyDetails;
import com.ovs.model.Election;
import com.ovs.model.Post;
import com.ovs.model.PostDetails;
import com.ovs.model.User;
import com.ovs.repository.PostDetailsRepository;

@Service
public class PostDetailsServiceImpl implements PostDetailsService {
	@Autowired
	private PostDetailsRepository postDetailsRepository;
	
	@Autowired
	private ElectionService electionService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CandidateVoteDetailsService candidateVoteDetailsService;
	
	@Autowired
	private CandidateApplyDetailsService candidateApplyDetailsService;
	
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

	@Override
	public void updateWinningDetails(Integer electionId) {
		Election ongoingElection=electionService.getOngoingElection();
		List<PostDetails> postList=ongoingElection.getPostDetails();
		Integer winningVote=0;
		Integer userId=null;
		Double winningPercentage=null;
		Integer totalUser=userService.getUserCount();
		for(PostDetails post :postList) {
			
			List<CandidateApplyDetails> candidateApplyDetailsList=candidateApplyDetailsService.getApprovedCandidateApplyDetailsByPostId(post.getPost().getPostId());
			for(CandidateApplyDetails candidate:candidateApplyDetailsList) {
				Integer voteCount=candidateVoteDetailsService.getCandidateVoteDetailsByPostIdAndElectionId(post.getPost().getPostId(),electionId,candidate.getUserId().getUserId());
				
				if(voteCount >= winningVote) {
					userId=candidate.getUserId().getUserId();
					winningVote=voteCount;
				}
			}
			winningPercentage=(double) ((winningVote*100)/totalUser);
			postDetailsRepository.updateWinningDetails(electionId,userId,winningPercentage,post.getPost().getPostId());
			winningVote=0;
			userId=null;
		}
	}
}
