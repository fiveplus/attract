package com.ace.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ace.entity.SysLog;
import com.ace.service.SysLogService;
import com.ace.util.PageCode;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/admin/syslog")
public class SysLogController extends BaseController{
	@Autowired
	private SysLogService sysLogService;
	
	@RequestMapping("/list/{page}")
	public String list(@PathVariable int page,HttpServletRequest request,Model model) {
		PageInfo<SysLog> pu = sysLogService.getSysLogList(page,PAGESIZE);
		PageCode pc = new PageCode(page, pu.getPages());
		model.addAttribute("pu",pu);
		model.addAttribute("pc",pc);
		return INDEX;
	}
	
}
