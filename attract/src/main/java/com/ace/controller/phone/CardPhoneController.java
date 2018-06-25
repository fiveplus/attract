package com.ace.controller.phone;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ace.controller.phone.bo.CardBO;
import com.ace.entity.Card;
import com.ace.entity.Register;
import com.ace.entity.SearchLog;
import com.ace.service.CardService;
import com.ace.service.RegisterService;
import com.ace.service.SearchLogService;
import com.ace.util.Resource;
import com.ace.util.StringUtils;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/phone/card")
public class CardPhoneController extends BaseController{
	@Autowired
	private CardService cardService;
	@Autowired
	private SearchLogService searchLogService;
	@Autowired
	private RegisterService registerService;
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String, Object> save(Card card,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，保存成功。";
		
		//TODO 查手机是否重复
		Card c = cardService.getCardToTelephone(card.getTelephone());
		if(c != null){
			c = cardService.getCardToEmail(card.getEmail());
			if(c == null){
				code = 4;
				message = "联系电话／联系邮箱重复，请检查后重新输入。";
			}
		}
		if(code == 0){
			card.setCreateTime(StringUtils.getDateToLong(new Date()));
			card.setStatus(Resource.W);
			cardService.save(card);
		}
		
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	@RequestMapping("/update.json")
	public @ResponseBody Map<String,Object> update(Card card,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，数据更新成功。";
		
		card.setStatus(Resource.W);
		cardService.updateSelective(card);
		
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	@RequestMapping("/list.json")
	public @ResponseBody Map<String,Object> list(int page,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，查询成功。";
		//String companyName = request.getParameter("companyName");
		String projectName = request.getParameter("projectName");
		String _parentId = request.getParameter("parentId");
		Integer parentId = _parentId != null ? Integer.parseInt(_parentId) : null;
		//TODO 根据like关键字查询相关信息
		//PageInfo<Card> pu = cardService.getCardListLikeProjectName(projectName,page,PAGESIZE); 
		
		//TODO 根据like关键字和领域ID查询相关信息
		PageInfo<Card> pu = cardService.getCardListToParentIdLikeProjectName(parentId, projectName, page, PAGESIZE); 
		
		returnMap.put("pu", pu);
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	@RequestMapping("/mylist.json")
	public @ResponseBody Map<String,Object> list(int page,int registerId,HttpServletRequest request,Model model){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，查询成功。";
		//String companyName = request.getParameter("companyName");
		String projectName = request.getParameter("projectName");
		//TODO 根据like关键字查询相关信息
		PageInfo<Card> pu = cardService.getCardListToRegisterIdAndLikeProjectName(registerId,projectName, page, PAGESIZE);
		
		returnMap.put("pu",pu);
		returnMap.put("code", code);
		returnMap.put("message",message);
		return returnMap;
	}
	
	
	@RequestMapping("/historys")
	public @ResponseBody Map<String,Object> historys(int page,int registerId,HttpServletRequest request,Model model){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，查询成功。";
		//String companyName = request.getParameter("companyName");
		String projectName = request.getParameter("projectName");
		//TODO 根据like关键字查询相关信息
		PageInfo<Card> pu = cardService.getHistoryCardListToRegisterIdAndLikeProjectName(registerId, projectName, page, PAGESIZE);
		
		returnMap.put("pu",pu);
		returnMap.put("code", code);
		returnMap.put("message",message);
		return returnMap;
	}
	
	
	@RequestMapping("/get.json")
	public @ResponseBody Map<String,Object> get(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，数据查询成功。";
		CardBO card = cardService.get(id);
		
		returnMap.put("card", card);
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	@RequestMapping("/search.json")
	public @ResponseBody Map<String,Object> search(Integer registerId,Integer cardId,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String message = "恭喜您，数据查询成功。";
		//TODO 检查是否查看过并添加查看记录
		SearchLog log = searchLogService.getSearchLogToRegisterIdAndCardId(registerId, cardId);
		if(log == null){
			Card card = cardService.queryById(cardId);
			Register user = registerService.queryById(registerId);
			//TODO 剩余次数是否充足
			if(user.getReadCount() > 0){
				//TODO 剩余次数--
				user.setReadCount(user.getReadCount() - 1);
				registerService.updateSelective(user);
				
				String content = user.getName()+"查看了["+card.getName()+"]的名片。";
				log = new SearchLog();
				log.setCardId(cardId);
				log.setRegisterId(registerId);
				log.setCreateTime(StringUtils.getDateToLong(new Date()));
				log.setContent(content);
				searchLogService.save(log);
			}else{
				code = 4;
				message = "很抱歉，剩余查看次数不足。";
			}
		}
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	@RequestMapping("/upload.json")
	public @ResponseBody Map<String,Object> upload(HttpServletRequest request,@RequestParam MultipartFile file) throws Exception{
		Map<String,Object> returnMap = new HashMap<String, Object>();
		String message = "恭喜您，上传图片成功。";
		int code = 0;
		String dir = System.getProperty("user.dir") + "/resources";
		String filePath = dir + "/upload_images/";
		File path = new File(filePath);
		if(!path.exists()){
			path.mkdirs();
		}
		String fileName = file.getOriginalFilename();
		if(fileName == null || "".equals(fileName)){
			code = 4;
			message = "错误！文件名不存在。";
		}else{
			String fileEx = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
			if(fileEx.equals(".png")|| fileEx.equals(".jpg")||fileEx.equals(".gif")||fileEx.equals(".jpeg")){
				String uuid = UUID.randomUUID().toString();
				String fn = uuid + fileEx;
        		try {  
    				//文件保存路径  
                    String fp = filePath + fn;
                    // 转存文件  
                    file.transferTo(new File(fp));
                   
                    String picture = "upload_images/"+fn;
                    returnMap.put("picture", picture);
           		
           		 } catch (Exception e) {  
                     e.printStackTrace();  
                 }  
			}else{
				code = 4;
				message = "错误！上传图片类型错误。";
			}
		}
		
		returnMap.put("code", code);
		returnMap.put("message", message);
		return returnMap;
	}
	
	
}
