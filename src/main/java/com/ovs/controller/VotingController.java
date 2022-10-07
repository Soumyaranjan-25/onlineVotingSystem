package com.ovs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ovs.model.Election;
import com.ovs.model.PostDetails;
import com.ovs.service.ElectionService;
import com.ovs.service.PostDetailsService;
import com.ovs.service.PostService;

@Controller
public class VotingController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private PostDetailsService postDetailsService;
	
	@Autowired
	private ElectionService electionService;
	
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
	
	
	
	
	@RequestMapping("/candidateApproved")
	public String candidateApproved(Model model) {
		return "candidateApproved";
	}
	
	@RequestMapping("/votingStatus")
	public String votingStatus(Model model) {
		return "votingStatus";
	}
}
