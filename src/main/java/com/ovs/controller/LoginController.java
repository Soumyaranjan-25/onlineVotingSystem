package com.ovs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ovs.model.Branch;
import com.ovs.model.Course;
import com.ovs.model.User;
import com.ovs.service.BranchService;
import com.ovs.service.CourseService;
import com.ovs.service.UserService;
import com.ovs.utils.CommonFileUpload;

@org.springframework.stereotype.Controller
public class LoginController {

	@Autowired
	private CourseService courseService;

	@Autowired
	private BranchService branchService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession httpSession;

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/dashboard")
	public String dashboard() {
		return "adminDashBoard";
	}

	@GetMapping("/signUp")
	public String signUp(Model model) {
		model.addAttribute("courseList", courseService.getAllCourse());
		model.addAttribute("branchList", branchService.getAllBranch());
		if(userService.getAllUser().size()==0) {
			return "adminresister";
		}
		return "resister";
	}

	@RequestMapping(path = "getBranchByCourse")
	public void getBranchByCourse(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam("courseId") Integer courseId) throws IOException {
		PrintWriter pw = resp.getWriter();
		Course course = courseService.getCourseById(courseId);
		String t = null;
		for (Branch branch : course.getBranch()) {
			t += "<option value='" + branch.getBranchId() + "'>" + branch.getBranchName() + "</option>";
		}
		pw.print(t);
	}
	
	@PostMapping("/saveUserbySingUp")
	public String saveUser(@ModelAttribute User user,@RequestParam("dobb") String dob,@RequestParam("studenIidCard") MultipartFile idCard,Model model) throws ParseException, IOException {
		Date birthDate=new SimpleDateFormat("dd/MM/yyyy").parse(dob);
		user.setDob(birthDate);
		String path = CommonFileUpload.singleFileUplaod(idCard, "idCard");
		user.setIdCard((path));
		user.setCreatedByRoleId(2);
		userService.saveUser(user);
		model.addAttribute("msg","Applicant saved successfully");
		return "login";
	}
	
	
	@PostMapping("/checkUser")
	private String checkUser(@RequestParam("userName") String userName, @RequestParam("password") String password,Model model) {
		if(userName==null || userName=="") {
			model.addAttribute("nullUserNameMsg","Please Enter User Name");
			return "login";
		}
		if(password=="") {
			model.addAttribute("nullPasswordMsg","Please Enter password");
			return "login";
		}
		User loginUser=userService.getUserByUserName(userName,password);
		httpSession.setAttribute("loginUser", loginUser);
		if(loginUser==null) {
			model.addAttribute("invalidMsg","invalid credentials");
			return "login";
		}
		if(loginUser.getRole().getRoleId()==1) {
			return "adminDashBoard";
		}
		else {
			return "userDashBoard";
		}
	}
	
}
