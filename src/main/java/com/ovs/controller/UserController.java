package com.ovs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ovs.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/userDetailsByUser")
	public String userDetailsByUser(Model model) {
		model.addAttribute("userList",userService.getUserByApproveStatus(1));
		return "userDetailsByUser";
	}
	
	@RequestMapping("/candidateApply")
	public String candidateApply(Model model) {
		model.addAttribute("userList",userService.getUserByApproveStatus(1));
		return "candidateApply";
	}
	
	@RequestMapping("/voteToCandidate")
	public String voteToCandidate(Model model) {
		model.addAttribute("userList",userService.getUserByApproveStatus(1));
		return "voteToCandidate";
	}
}
