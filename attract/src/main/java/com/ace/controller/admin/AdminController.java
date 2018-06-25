package com.ace.controller.admin;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.entity.User;
import com.ace.service.PermissionService;
import com.ace.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PermissionService permissionService;
	
	@RequestMapping("/")
	public String index(HttpServletRequest request,Model model){
		User user = (User)request.getAttribute("user");
		if(user == null){
			return LOGIN;
		}else{
			return INDEX;
		}
	}
	
	@RequestMapping("/login")
	public String login(Model model){
		return LOGIN;
	}
}
