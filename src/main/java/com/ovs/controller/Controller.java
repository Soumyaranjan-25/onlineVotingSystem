package com.ovs.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {
	@RequestMapping("/login")
	public String login() {
		return "loginForm";
	}
	
	@RequestMapping("/branch")
	public String branch() {
		return "branch";
	}
}
