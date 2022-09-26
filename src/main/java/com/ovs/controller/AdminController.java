package com.ovs.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ovs.model.User;
import com.ovs.service.BranchService;
import com.ovs.service.CourseService;
import com.ovs.service.UserService;
import com.ovs.utils.CommonFileUpload;

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
		model.addAttribute("userList", userService.getAllUserByAdmin());

		return "addUserByAdmin";
	}
	
	@PostMapping("/saveUserByAdmin")
	public String saveUserByAdmin(@ModelAttribute User user,@RequestParam("dobb") String dob,@RequestParam("studenIidCard") MultipartFile idCard,Model model) throws ParseException, IOException {
		Date birthDate=new SimpleDateFormat("dd/MM/yyyy").parse(dob);
		user.setDob(birthDate);
		String path = CommonFileUpload.singleFileUplaod(idCard, "idCard");
		user.setIdCard((path));
		user.setCreatedByRoleId(1);
		userService.saveUser(user);
		model.addAttribute("msg","Applicant saved successfully");
		return "forward:/addUserByAdmin";
	}
	@RequestMapping("/updateUserByAdmin")
	public String updateUserByAdmin(@RequestParam("userId") Integer userId,Model model) {
		User updateUser=userService.getUserByUserId(userId);
		model.addAttribute("updateUser",updateUser);
		return "forward:/addUserByAdmin";
	}
}
