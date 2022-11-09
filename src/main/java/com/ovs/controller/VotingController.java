package com.ovs.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ovs.model.CandidateApplyDetails;
import com.ovs.model.CandidateVoteDetails;
import com.ovs.model.Election;
import com.ovs.model.Post;
import com.ovs.model.PostDetails;
import com.ovs.model.User;
import com.ovs.service.CandidateApplyDetailsService;
import com.ovs.service.CandidateVoteDetailsService;
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
	private CandidateVoteDetailsService candidateVoteDetailsservice;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private CandidateApplyDetailsService candidateApplyDetailsService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/votingControl")
	public String votingControl(Model model) {
		model.addAttribute("postList",postService.getAllPost());
		model.addAttribute("postDetailsList",postDetailsService.getAllPostDetails());
		model.addAttribute("onGoingElection",electionService.getElection());
		System.out.println(electionService.getElection());
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
	
	@GetMapping("/electionDetails")
	public String electionDetails(@ModelAttribute Election election) {
	
		Election saveElection=electionService.saveElectionDetails(election);
		postDetailsService.updateElection(saveElection.getElectionId());
		return "forward:/votingControl";
	}
	@RequestMapping(value = "/manageElection", method = RequestMethod.POST, params = "end")
	public String endElection() {
		Integer electionId=electionService.getElection().getElectionId();
		postDetailsService.updateWinningDetails(electionId);
		postDetailsService.deletepostDetailsByElectionId(electionId);
		candidateApplyDetailsService.deleteCandidateDetailsByElectionId(electionId);
		electionService.deleteElection(electionId);
		return "forward:/votingControl";
	}
	@RequestMapping(value = "/manageElection", method = RequestMethod.POST, params = "start")
	public String startElection() {
		Integer electionId=electionService.getElection().getElectionId();
		electionService.startElection(electionId);
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
		User loginUser=(User) httpSession.getAttribute("loginUser");
		Election ongoingElection=electionService.getElection();
		model.addAttribute("onGoingElection",ongoingElection);
		List<PostDetails> ongoingELectionPostDetailsList=ongoingElection.getPostDetails();
		List<CandidateVoteDetails> candidateVoteDetailsList=candidateVoteDetailsservice.getCandidateVoteDetailsByUserId(loginUser.getUserId(),ongoingElection.getElectionId());
		for(Integer i=ongoingELectionPostDetailsList.size()-1;i>=0;i--) {
			for(CandidateVoteDetails candidateVoteDetails:candidateVoteDetailsList) {
				System.out.println(ongoingELectionPostDetailsList.get(i));
				if(ongoingELectionPostDetailsList.get(i).getPost().getPostId()==candidateVoteDetails.getPost().getPostId()) {
					ongoingELectionPostDetailsList.remove(ongoingELectionPostDetailsList.get(i));
					break;
				}
			}
		}
		model.addAttribute("ongoingELectionPostDetailsList",ongoingELectionPostDetailsList);
		model.addAttribute("approvedCandidateList",candidateApplyDetailsService.getApprovedCandidateApplyDetails());
		model.addAttribute("candidateVotingDetailsList",candidateVoteDetailsList);
		return "voteToCandidate";
	}
	
	@RequestMapping("/saveCandidateVote")
	public String saveCandidateVote(@RequestParam("candidateApplyId") Integer candidateApplyId) {
		User loginUser=(User) httpSession.getAttribute("loginUser");
		candidateVoteDetailsservice.saveCandidateVote(candidateApplyId,loginUser);

		return "forward:/voteToCandidate";
	}
	
	
	@RequestMapping("/votingStatus")
	public String votingStatus(Model model) {
		Election ongoingElection=electionService.getLatestElection();
		Integer voter=candidateVoteDetailsservice.getCandidateVoteDetailsByElectionId(ongoingElection.getElectionId());
		Integer user=userService.getUserCount();
		Integer votePercentage= (voter*100)/user;
		model.addAttribute("votePercentage",votePercentage);
		model.addAttribute("onGoingElection",ongoingElection);
		return "votingStatus";
	}
	
	@RequestMapping("/electionResultsForUser")
	public String electionResultsForUser(Model model) {
		Election ongoingElection=electionService.getLatestElection();
		model.addAttribute("onGoingElection",ongoingElection);
		return "electionResultsForUser";
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
		model.addAttribute("candidateApplyDetailsList",candidateApplyDetailsService.getCandidateApplyDetails());
		model.addAttribute("ApprovedcandidateApplyDetailsList",candidateApplyDetailsService.getApprovedCandidateApplyDetails());
		return "candidateApproved";
	}
	
	@GetMapping("/updateCandidateApproved")
	public String updateCandidateApproved(@RequestParam("candidateApplyId") Integer candidateApplyId) {
		candidateApplyDetailsService.candidateApproved(candidateApplyId);
		return "forward:/candidateApproved";
	}
	@GetMapping("/candidateDiscard")
	public String candidateDiscard(@RequestParam("candidateApplyId") Integer candidateApplyId,Model model) {
		candidateApplyDetailsService.candidateDiscard(candidateApplyId);
		return "forward:/candidateApproved";
	}
	
	
}
