package com.ace.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.entity.Domain;
import com.ace.entity.Group;
import com.ace.service.DomainService;
import com.ace.util.PageCode;
import com.ace.util.StringUtils;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/admin/domain")
public class DomainAdminController extends BaseController{
	@Autowired
	private DomainService domainService;
	
	@RequestMapping("/list/{page}")
	public String list(@PathVariable int page,HttpServletRequest request,Model model) {
		PageInfo<Domain> pu = domainService.queryPageListByWhere(null,page,PAGESIZE);
		PageCode pc = new PageCode(page, pu.getPages());
		model.addAttribute("pu",pu);
		model.addAttribute("pc",pc);
		return INDEX;
	}
	
	@RequestMapping("/upt/{id}")
	public String upt(@PathVariable int id,HttpServletRequest request,Model model) {
		Domain domain = domainService.queryById(id);
		List<Domain> parents = domainService.getDomainParentList();
		model.addAttribute("parents",parents);
		model.addAttribute("domain",domain);
		return INDEX;
	}
	
	@RequestMapping("/update")
	public @ResponseBody Map<String,Object> update(Domain domain,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int count  = domainService.updateSelective(domain);
		if(count > 0) {
			returnMap.put("msg", "成功！很好地完成了提交。");
			returnMap.put("code", 0);
		}else {
			returnMap.put("msg", "错误！请进行一些更改。");
			returnMap.put("code", 4);
		}
		return returnMap;
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request,Model model) {
		List<Domain> parents = domainService.getDomainParentList();
		model.addAttribute("parents",parents);
		return INDEX;
	}
	
	@RequestMapping("/save")
	public @ResponseBody Map<String,Object> save(Domain domain,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String,Object>();
		domain.setCreateTime(StringUtils.getDateToLong(new Date()));
		int count = domainService.saveSelect(domain);
		if(count > 0) {
			returnMap.put("msg", "成功！很好地完成了提交。");
			returnMap.put("code", 0);
		}else {
			returnMap.put("msg", "错误！请进行一些更改。");
			returnMap.put("code", 4);
		}
		return returnMap;
	}
	
	
	
	@RequestMapping("/parents")
	public @ResponseBody Map<String,Object> parent(HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "恭喜您，查询成功。";
		
		List<Domain> parents = domainService.getDomainParentList();
		
		returnMap.put("parents", parents);
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	@RequestMapping("/childs")
	public @ResponseBody Map<String,Object> childs(int parentId,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "恭喜您，查询成功。";
		
		List<Domain> childs = domainService.getDomainChildsToParentId(parentId);
		
		returnMap.put("childs", childs);
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
}
