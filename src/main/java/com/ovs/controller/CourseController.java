package com.ovs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ovs.model.Course;
import com.ovs.service.CourseService;

@Controller
public class CourseController {
	@Autowired
	private CourseService courseService;
	@RequestMapping("/course")
	public String course(Model model) {
		System.out.println(courseService.getAllCourse());
		model.addAttribute("courseList",courseService.getAllCourse());
		return "course";
	}

	@PostMapping("/saveCourse")
	public String saveCourse(@ModelAttribute Course course,Model model) {
		courseService.saveCourse(course);
		model.addAttribute("msg","Course saved Successfully");
		return "forward:/course";
	}
	@RequestMapping("/deleteCourse")
	public String deleteCourse(@RequestParam("courseId") Integer courseId) {
		System.out.println("Its coming");
		courseService.deleteCourse(courseId);
		return "forward:/course";
	}
	@RequestMapping("/updateCourse")
	public String updateCourse(@RequestParam("courseId") Integer courseId,Model model) {
		model.addAttribute("updateCourse",courseService.getCourseById(courseId));
		return "forward:/course";
	}
	
}
