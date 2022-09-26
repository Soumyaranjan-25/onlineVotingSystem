package com.ovs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ovs.service.BranchService;
import com.ovs.service.CourseService;
import com.ovs.service.UserService;

@org.springframework.stereotype.Controller
public class AdminController {
	@Autowired
	private CourseService courseService;

	@Autowired
	private BranchService branchService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/addUserByAdmin")
	public String addUserByAdmin(Model model) {
		model.addAttribute("courseList", courseService.getAllCourse());
		model.addAttribute("branchList", branchService.getAllBranch());
		model.addAttribute("userList", userService.getAllUser());

		return "addUserByAdmin";
	}
}
