package com.ace.controller.phone;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.entity.Message;
import com.ace.service.MessageService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/phone/message")
public class MessagePhoneController extends BaseController{
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/list.json")
	public @ResponseBody Map<String,Object> list(int page,Integer registerId,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，查询成功。";
		
		PageInfo<Message> pu = messageService.getMessageListToRegisterId(registerId,page,PAGESIZE);
		
		returnMap.put("pu", pu);
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
}
