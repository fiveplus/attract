package com.ace.controller.admin;

import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ace.controller.admin.bo.DemandBO;
import com.ace.controller.phone.bo.CardBO;
import com.ace.entity.Card;
import com.ace.entity.Domain;
import com.ace.entity.Message;
import com.ace.entity.Register;
import com.ace.service.CardService;
import com.ace.service.DomainService;
import com.ace.service.MessageService;
import com.ace.service.RegisterService;
import com.ace.util.KeyValue;
import com.ace.util.PageCode;
import com.ace.util.Resource;
import com.ace.util.StringUtils;
import com.ace.util.poi.ExcelUtils;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/admin/card")
public class CardAdminController extends BaseController{
	@Autowired
	private CardService cardService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private RegisterService registerService;
	@Autowired
	private DomainService domainService;
	
	@RequestMapping("/list/{page}")
	public String list(@PathVariable int page,HttpServletRequest request,Model model){
		PageInfo<CardBO> pu = cardService.getCardList(page,PAGESIZE);
		PageCode pc = new PageCode(page, pu.getPages());
		model.addAttribute("pu", pu);
		model.addAttribute("pc", pc);
		return INDEX;
	}
	
	@RequestMapping("/select/{id}")
	public String select(@PathVariable int id,HttpServletRequest request,Model model){
		CardBO c = cardService.get(id);
		model.addAttribute("card",c);
		return INDEX;
	}
	
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request,Model model){
		//TODO demands 
		model.addAttribute("demands",Resource.DEMANDS);
		model.addAttribute("stages",Resource.STAGES);
		return INDEX;
	}
	
	@RequestMapping("/save")
	public @ResponseBody Map<String,Object> save(Card card,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "恭喜您，数据保存成功。";
		
		//TODO 查手机是否重复
		Card c = cardService.getCardToTelephone(card.getTelephone());
		if(c != null){
			c = cardService.getCardToEmail(card.getEmail());
			if(c != null){
				code = 4;
				msg = "联系电话／联系邮箱重复，请检查后重新输入。";
			}
		}
		if(code == 0){
			card.setCreateTime(StringUtils.getDateToLong(new Date()));
			card.setStatus(Resource.Y);
			cardService.save(card);
		}
		
		returnMap.put("code", code);
		returnMap.put("message", msg);
		return returnMap;
	}
	
	@RequestMapping("/upt/{id}")
	public String upt(@PathVariable int id,HttpServletRequest request,Model model){
		CardBO card = cardService.get(id);
		model.addAttribute("card",card);
		
		//TODO demands 
		List<DemandBO> demands = Resource.DEMANDS;
		
		String[] demandstrs = card.getDemand().split(",");
		
		for(DemandBO dbo:demands){
			for(int i = 0;i < demandstrs.length;i++){
				if(dbo.getName().equals(demandstrs[i])){
					dbo.setChecked(true);
				}
			}
		}
		
		model.addAttribute("demands",demands);
		
		return INDEX;
	}
	
	@RequestMapping("/update")
	public @ResponseBody Map<String,Object> update(Card card,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "恭喜您，数据更新成功。";

		cardService.updateSelective(card);
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	
	/**
	 * 名片审核
	 * @param flag
	 * @param id
	 * @param content
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/audit")
	public @ResponseBody Map<String,Object> audit(boolean flag,Integer id,String content,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "恭喜您，审核成功。";
		Card card = cardService.queryById(id);
		String cont = "恭喜您，名片["+card.getName()+"]通过了审核。";
		int type = 0;
		if(flag){
			card.setStatus(Resource.Y);
			//TODO 次数++
			Register user = registerService.queryById(card.getRegisterId());
			user.setReadCount(user.getReadCount() + 1);
			registerService.updateSelective(user);
		}else{
			card.setStatus(Resource.N);
			cont = "名片["+card.getName()+"]未通过审核，原因："+content;
			type = 1;
		}
		//TODO 新增消息记录
		Message m = new Message();
		m.setCardId(id);
		m.setRegisterId(card.getRegisterId());
		m.setContent(cont);;
		m.setType(type);
		m.setCreateTime(StringUtils.getDateToLong(new Date()));
		messageService.save(m);
		//TODO 修改名片状态
		cardService.updateSelective(card);
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	@RequestMapping("/upload")
	public @ResponseBody Map<String,Object> upload(HttpServletRequest request,@RequestParam MultipartFile file) throws Exception{
		Map<String,Object> returnMap = new HashMap<String,Object>();
		int code = 0;
		String msg = "成功！很好的完成了提交。";
		String fileName = file.getOriginalFilename();
		if(fileName == null || "".equals(fileName)){
			code = 4;
			msg = "错误！文件名不存在！";
		}else{
			String fileEx = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
			if(fileEx.equals(".xlsx")||fileEx.equals("xls")){
				InputStream in = null;
				try {
					//TODO 获取excel读取的list
					in = file.getInputStream();
					List<List<String>> list = ExcelUtils.readExcel(in);
					msg = saveCards(list);
					if(msg.equals("")){
						msg = "成功！很好的完成了提交。";
					}else{
						code = 4;
					}
				} catch (Exception e) {
					code = 4;
	                msg = "错误！文件上传错误。";
					e.printStackTrace();
				}finally{
					if(in != null){
						in.close();
					}
				}
			}else{
				code = 4;
                msg = "错误！上传文件类型错误。";
			}
		}
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	private String saveCards(List<List<String>> list){
		String msg = "";
		int index = 0;
		for(List<String> l : list){
			index++;
			String remark = l.get(6).trim();
			String websize = l.get(5).trim();

			String name = l.get(0).trim();
			String job = l.get(2).trim();
			String companyName = l.get(3).trim();
			String telephone = l.get(1).trim();
			String email = l.get(4).trim();
			String demand = l.get(7).trim();
			String domain = l.get(8).trim();
			
			String projectName = l.get(9).trim();
			String projectStage = l.get(10).trim();
			String projectBrief = l.get(11).trim();
			
			if(name.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，姓名不能为空。";
				break;
			}
			if(job.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，职位不能为空。";
				break;
			}
			/*
			if(companyName.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，公司名称不能为空。";
				break;
			}
			
			if(telephone.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，联系电话不能为空。";
				break;
			}
			*/
			if(email.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，E-mail不能为空。";
				break;
			}
			if(demand.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，客户需求不能为空。";
				break;
			}
			if(domain.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，相关领域不能为空。";
				break;
			}
			
			if(projectName.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，项目名称不能为空。";
				break;
			}
			
			if(projectStage.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，项目阶段不能为空。";
				break;
			}
			
			if(projectBrief.equals("")){
				msg = "错误！数据上传错误。第" + index + "行，项目简介不能为空。";
				break;
			}
			
			//TODO email格式
			/*
			if(!isEmail(email)){
				msg = "错误！数据上传错误。第" + index + "行，邮箱格式错误。";
				break;
			}*/
			
			//TODO 邮箱是否重复
			Card c = cardService.getCardToEmail(email);
			if(c != null){
				msg = "错误！数据上传错误。第" + index + "行，E-mail重复，请检查后重新输入。";
				break;
			}
			
			String[] demands = demand.split(",");
			boolean isDemand = true;
			for(String str:demands){
				boolean flag = false;
				for(DemandBO dbo:Resource.DEMANDS){
					if(str.equals(dbo.getName())){
						flag = true;
						break;
					}
				}
				if(!flag){
					isDemand = false;
					break;
				}
			}
			
			boolean isStage = false;
			for(KeyValue ky:Resource.STAGES){
				if(projectStage.equals(ky.getKey())){
					isStage = true;
					break;
				}
			}
			
			if(!isStage){
				msg = "错误！数据上传错误。第"+ index + "行，项目阶段不存在。";
			}
			
			if(!isDemand){
				msg = "错误！数据上传错误。第" + index + "行，客户需求不存在。";
				break;
			}
			
			Domain d = domainService.getDomainChildToName(domain);
			if(d == null){
				msg = "错误！数据上传错误。第" + index + "行，相关领域不存在。";
				break;
			}
			
			Card card = new Card();
			card.setCompanyName(companyName);
			card.setCreateTime(StringUtils.getDateToLong(new Date()));
			card.setDemand(demand);
			card.setDomainId(d.getId());
			card.setEmail(email);
			card.setJob(job);
			card.setName(name);
			card.setRemark(remark);
			card.setStatus(Resource.Y);
			card.setTelephone(telephone);
			card.setWebsize(websize);
			card.setProjectName(projectName);
			card.setProjectStage(projectStage);
			card.setProjectBrief(projectBrief);
			cardService.saveSelect(card);
		}
		return msg;
		
	}
	
	
	
}
