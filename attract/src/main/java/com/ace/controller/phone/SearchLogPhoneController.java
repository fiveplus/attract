package com.ace.controller.phone;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.entity.SearchLog;
import com.ace.service.SearchLogService;

@Controller
@RequestMapping("/phone/searchlog")
public class SearchLogPhoneController extends BaseController{
	@Autowired
	private SearchLogService searchLogService;
	
	@RequestMapping("/check.json")
	public @ResponseBody Map<String, Object> check(Integer registerId,Integer cardId,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，查询成功。";
		
		SearchLog log = searchLogService.getSearchLogToRegisterIdAndCardId(registerId,cardId);
		if(log == null){
			code = 4;
			message = "很抱歉，您没有查看权限。";
		}
		
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	
}
