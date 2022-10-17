package com.ovs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ovs.model.Branch;
import com.ovs.model.Course;
import com.ovs.service.BranchService;
import com.ovs.service.CourseService;

@Controller
public class BranchController {
	@Autowired
	private BranchService branchService;
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/branch")
	public String branch(Model model) {
		model.addAttribute("courseList",courseService.getAllCourse());
		model.addAttribute("branchList",branchService.getAllBranch());
		return "branch";
	}

	@PostMapping("/saveBranch")
	public String saveBranch(@ModelAttribute Branch branch,Model model) {
		branchService.saveBranch(branch);
		model.addAttribute("msg","Branch saved Successfully");
		return "forward:/branch";
	}
	
	@RequestMapping("/deleteBranch")
	public String deleteBranch(@RequestParam("branchId") Integer branchId) {
		branchService.deleteBranch(branchId);
		return "forward:/branch";
	}
	
	@RequestMapping("/updateBranch")
	public String updateBranch(@RequestParam("branchId") Integer branchId,Model model) {
		model.addAttribute("updateBranch",branchService.getBranchById(branchId));
		System.out.println(branchService.getBranchById(branchId));
		return "forward:/branch";
	}

}
