package com.ace.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.entity.Register;
import com.ace.entity.SysLog;
import com.ace.entity.User;
import com.ace.service.RegisterService;
import com.ace.service.SysLogService;
import com.ace.util.PageCode;
import com.ace.util.StringUtils;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/admin/register")
public class RegisterAdminController extends BaseController{
	@Autowired
	private RegisterService registerService;
	@Autowired
	private SysLogService sysLogService;
	
	@RequestMapping("/list/{page}")
	public String list(@PathVariable int page,HttpServletRequest request,Model model){
		PageInfo<Register> pu = registerService.queryPageListByWhere(null, page, PAGESIZE);
		PageCode pc = new PageCode(page, pu.getPages());
		model.addAttribute("pu",pu);
		model.addAttribute("pc",pc);
		return INDEX;
	}
	
	@RequestMapping("/get.json")
	public @ResponseBody Map<String,Object> get(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "恭喜您，数据查询成功！";

		Register register = registerService.queryById(id);
		
		returnMap.put("register", register);
		returnMap.put("code", code);
		returnMap.put("message", msg);
		
		return returnMap;
	}
	
	@RequestMapping("/uptCount")
	public @ResponseBody Map<String,Object> uptCount(int id,int addCount,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int code = 0;
		String msg = "恭喜您，次数修改成功！";
		
		Register register = registerService.queryById(id);
		int newCount = register.getReadCount() + addCount;
		register.setReadCount(newCount);
		registerService.updateSelective(register);
		
		//TODO 写入log
		User user = (User) request.getAttribute("user");
		SysLog log = new SysLog();
		log.setCreateTime(StringUtils.getDateToLong(new Date()));
		log.setUserId(user.getId());
		log.setCreateUser(user.getUserName());
		log.setContent(user.getUserName()+"为["+register.getName()+"]充值次数："+addCount);
		sysLogService.saveSelect(log);
		
		returnMap.put("code", code);
		returnMap.put("message", msg);
		return returnMap;
		
	}
	
}
