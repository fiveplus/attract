package com.ace.controller.phone;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.entity.Domain;
import com.ace.service.DomainService;

@Controller
@RequestMapping("/phone/domain")
public class DomainPhoneController extends BaseController{
	@Autowired
	private DomainService domainService;
	
	@RequestMapping("/parents.json")
	public @ResponseBody Map<String,Object> parent(HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，查询成功。";
		
		List<Domain> parents = domainService.getDomainParentList();
		
		returnMap.put("parents", parents);
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	@RequestMapping("/childs.json")
	public @ResponseBody Map<String,Object> childs(int parentId,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，查询成功。";
		
		List<Domain> childs = domainService.getDomainChildsToParentId(parentId);
		
		returnMap.put("childs", childs);
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
}
