package com.ovs.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ovs.model.User;
import com.ovs.repository.UserRepository;
import com.ovs.service.BranchService;
import com.ovs.service.CourseService;
import com.ovs.service.PostService;
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
	
	@Autowired
	private UserRepository userRepository;
	
	

	@RequestMapping("/addUserByAdmin")
	public String addUserByAdmin(Model model) {
		model.addAttribute("courseList", courseService.getAllCourse());
		model.addAttribute("branchList", branchService.getAllBranch());
		model.addAttribute("userList", userService.getAllUserByAdmin());

		return "addUserByAdmin";
	}

	@PostMapping("/saveUserByAdmin")
	public String saveUserByAdmin(@ModelAttribute User user, @RequestParam("dobb") String dob,
			@RequestParam("studenIidCard") MultipartFile idCard, Model model) throws ParseException, IOException {
		Date birthDate = new SimpleDateFormat("dd/MM/yyyy").parse(dob);
		user.setDob(birthDate);
		User privousUser=userService.getUserByUserId(user.getUserId());
		String path="";
		if (idCard != null) {
			path = CommonFileUpload.singleFileUplaod(idCard, "idCard");
			
		}
		if(path=="FileEmpty") {
			path=privousUser.getIdCard();
		}
		user.setIdCard((path));
		user.setCreatedByRoleId(1);
		user.setApproveBy(1);
		userService.saveUser(user,privousUser);
		model.addAttribute("msg", "Applicant saved successfully");
		return "forward:/addUserByAdmin";
	}

	@RequestMapping("/updateUserByAdmin")
	public String updateUserByAdmin(@RequestParam("userId") Integer userId, Model model) {
		User updateUser = userService.getUserByUserId(userId);
		model.addAttribute("updateUser", updateUser);
		return "forward:/addUserByAdmin";
	}
	
	@RequestMapping("/deleteUserByAdmin")
	public String deleteUserByAdmin(@RequestParam("userId") Integer userId) {
		userService.deleteByUserId(userId);
		return "forward:/addUserByAdmin";
	}

	@GetMapping("/downloadFile")
	public void downloadFile(@RequestParam("userId") Integer userId, HttpServletResponse response) throws IOException {
		System.out.println("Inside Download File--------->>");
		User user = userService.getUserByUserId(userId);
		CommonFileUpload.downloadFile(response, user.getIdCard());
	}
	
	@RequestMapping("/userListByAdmin")
	public String getUserListByAdmin(Model model) {
		model.addAttribute("pendingUserList",userService.getUserByApproveStatus(0));
		model.addAttribute("approvedUserList",userService.getUserByApproveStatus(1));
		model.addAttribute("discardUserList",userService.getUserByApproveStatus(2));
		return "userListByAdmin";
	}
	
	@RequestMapping("/approvedByAdmin")
	public String approvedByAdmin(@RequestParam("userId") Integer userId) {
		User user=userService.getUserByUserId(userId);
		user.setApproveStatus(1);
		user.setApproveBy(1);
		userRepository.save(user);
		return "forward:/userListByAdmin";
	}
	
	@RequestMapping("/discardByAdmin")
	public String discardByAdmin(@RequestParam("userId") Integer userId) {
		User user=userService.getUserByUserId(userId);
		user.setApproveStatus(2);
		user.setBitstatus("true");
		userRepository.save(user);
		return "forward:/userListByAdmin";
	}
	
	
	
	
}
