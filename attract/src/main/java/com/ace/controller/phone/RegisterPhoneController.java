package com.ace.controller.phone;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.entity.Register;
import com.ace.service.RegisterService;
import com.ace.util.StringUtils;

@Controller
@RequestMapping("/phone/register")
public class RegisterPhoneController extends BaseController{
	@Autowired
	private RegisterService registerService;
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(Register register,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "";
		Register user = registerService.getRegisterToTelephone(register.getTelephone());
		if(user == null){
			register.setCreateTime(StringUtils.getDateToLong(new Date()));
			register.setReadCount(READ_COUNT);
			registerService.save(register);
			message = "恭喜您，注册成功。";
		}else{
			code = 4;
			message = "很抱歉，该联系电话已被注册。";
		}
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	@RequestMapping("/update.json")
	public @ResponseBody Map<String,Object> update(Register register,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<>();
		int code = 0;
		String message = "";
		Register user = registerService.getRegisterToTelephone(register.getTelephone());
		if(user == null){
			registerService.updateSelective(register);
			message = "恭喜您，注册成功。";
		}else{
			//TODO 手机号码未更改可以注册
			if(register.getTelephone().equals(user.getTelephone())){
				registerService.updateSelective(register);
				message = "恭喜您，注册成功。";
			}else{
				code = 4;
				message = "很抱歉，该联系电话已被注册。";
			}
		}
		
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	
	@RequestMapping("/get.json")
	public @ResponseBody Map<String,Object> get(String wechatId,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，查询成功。";
		Register register = registerService.getRegisterToWechatId(wechatId);
		
		returnMap.put("user", register);
		returnMap.put("code", code);
		returnMap.put("message",message);
		return returnMap;
	}
	
	@RequestMapping("/select.json")
	public @ResponseBody Map<String,Object> select(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，查询成功。";
		Register register = registerService.queryById(id);
		
		returnMap.put("user", register);
		returnMap.put("code", code);
		returnMap.put("message",message);
		return returnMap;
	}
	
}
