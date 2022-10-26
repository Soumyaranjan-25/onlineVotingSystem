package com.ovs.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ovs.model.CandidateApplyDetails;
import com.ovs.model.Election;
import com.ovs.model.Post;
import com.ovs.model.PostDetails;
import com.ovs.model.User;
import com.ovs.service.CandidateApplyDetailsService;
import com.ovs.service.ElectionService;
import com.ovs.service.PostDetailsService;
import com.ovs.service.PostService;
import com.ovs.service.UserService;

@Controller
public class VotingController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private PostDetailsService postDetailsService;
	
	@Autowired
	private ElectionService electionService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private CandidateApplyDetailsService candidateApplyDetailsService;
	
	@RequestMapping("/votingControl")
	public String votingControl(Model model) {
		model.addAttribute("postList",postService.getAllPost());
		model.addAttribute("postDetailsList",postDetailsService.getAllPostDetails());
		model.addAttribute("onGoingElection",electionService.getElection());
		return "votingControl";
	}
	
	@PostMapping("/savePostDetails")
	public String savePostDetails(@ModelAttribute PostDetails postDetails) {
	
		 postDetailsService.savePostDetails(postDetails);
		return "forward:/votingControl";
	}
	@GetMapping("/updatepostDetails")
	public String updatepostDetails(@RequestParam("postDetailsId") Integer postDetailsId,Model model) {
		model.addAttribute("updatePostDetails",postDetailsService.getPostDetailsById(postDetailsId));
		return "forward:/votingControl";
	}
	@GetMapping("/deletepostDetails")
	public String deletepostDetails(@RequestParam("postDetailsId") Integer postDetailsId,Model model) {
		postDetailsService.deletepostDetails(postDetailsId);
		return "forward:/votingControl";
	}
	
	@PostMapping("/electionDetails")
	public String electionDetails(@ModelAttribute Election election) {
	
		Election saveElection=electionService.savePostDetails(election);
		postDetailsService.updateElection(saveElection.getElectionId());
		return "forward:/votingControl";
	}
	@PostMapping("/endElection")
	public String endElection(@RequestParam("electionName") String  electionName) {
		
		Integer electionId=electionService.getElectionIdByElectionName(electionName);
		electionService.deleteElection(electionId);
		postDetailsService.deletepostDetailsByElectionId(electionId);
		return "forward:/votingControl";
	}
	
	@RequestMapping("/candidateApply")
	public String candidateApply(Model model) {
		model.addAttribute("onGoingElection",electionService.getElection());
		User loginUser=(User) httpSession.getAttribute("loginUser");
		CandidateApplyDetails appliedPost=candidateApplyDetailsService.getCandidateDetailsByUser(loginUser);
		model.addAttribute("appliedPost",appliedPost);
		System.out.println(appliedPost);
		return "candidateApply";
	}
	
	@RequestMapping("/voteToCandidate")
	public String voteToCandidate(Model model) {
		model.addAttribute("userList",userService.getUserByApproveStatus(1));
		
		return "voteToCandidate";
	}
	
	
	
	@RequestMapping("/votingStatus")
	public String votingStatus(Model model) {
		return "votingStatus";
	}
	
	@RequestMapping("/applyForPost")
	public String applyForPost(@RequestParam("postId") Integer postId,@RequestParam("electionId") Integer electionId,Model model) {
		User loginUser=(User) httpSession.getAttribute("loginUser");
		CandidateApplyDetails candidateApplyDetails=new CandidateApplyDetails();
		Post post=postService.getPostById(postId);
		candidateApplyDetails.setPostId(post);
		candidateApplyDetails.setUserId(loginUser);
		candidateApplyDetails.setApplyOn(new Date());
		candidateApplyDetails.setBitstatus("false");
		candidateApplyDetails.setCandidateStatus(0);
		candidateApplyDetails.setElection(electionService.getElectionById(electionId));
		candidateApplyDetailsService.saveCandidateApply(candidateApplyDetails);
		return "forward:/candidateApply";
	}
	
	@GetMapping("/deleteAppliedPost")
	public String deleteAppliedPost(@RequestParam("candidateApplyId") Integer candidateApplyId,Model model) {
		candidateApplyDetailsService.deleteAppliedPost(candidateApplyId);
		return "forward:/candidateApply";
	}
	
	@RequestMapping("/candidateApproved")
	public String candidateApprovePage(Model model) {
		model.addAttribute("ongoinElection",electionService.getOngoingElection());
		
		return "candidateApproved";
	}
	
}
