package com.ace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.controller.phone.bo.CardBO;
import com.ace.dao.CardMapper;
import com.ace.entity.Card;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("cardService")
public class CardService extends BaseService<Card>{
	@Autowired
	private CardMapper cardMapper;
	
	public PageInfo<CardBO> getCardList(int page,int pageSize){
		PageHelper.startPage(page,pageSize);
		List<CardBO> list = cardMapper.getCardList();
		PageInfo<CardBO> pu = new PageInfo<CardBO>(list);
		return pu;
		
	}
	//TODO like companyName
	public PageInfo<Card> getCardListLikeCompanyName(String companyName,int page,int pageSize){
		PageHelper.startPage(page,pageSize);
		List<Card> list = cardMapper.getCardListLikeCompanyName(companyName);
		PageInfo<Card> pu = new PageInfo<Card>(list);
		return pu;
	}
	
	public PageInfo<Card> getCardListToRegisterIdAndLikeCompanyName(Integer registerId,String companyName,int page,int pageSize){
		PageHelper.startPage(page,pageSize);
		List<Card> list = cardMapper.getCardListToRegisterIdAndLikeCompanyName(registerId,companyName);
		PageInfo<Card> pu = new PageInfo<Card>(list);
		return pu;
	}
	
	public PageInfo<Card> getHistoryCardListToRegisterIdAndLikeCompanyName(Integer registerId,String companyName,int page,int pageSize){
		PageHelper.startPage(page,pageSize);
		List<Card> list = cardMapper.getHistoryCardListToRegisterIdAndLikeCompanyName(registerId,companyName);
		PageInfo<Card> pu = new PageInfo<Card>(list);
		return pu;
	}
	//TODO like projectName
	public PageInfo<Card> getCardListLikeProjectName(String projectName,int page,int pageSize){
		PageHelper.startPage(page,pageSize);
		List<Card> list = cardMapper.getCardListLikeProjectName(projectName);
		PageInfo<Card> pu = new PageInfo<Card>(list);
		return pu;
	}
	//TODO to parentId and like projectName
	public PageInfo<Card> getCardListToParentIdLikeProjectName(Integer parentId,String projectName,int page,int pageSize){
		PageHelper.startPage(page,pageSize);
		List<Card> list = cardMapper.getCardListToParentIdLikeProjectName(parentId, projectName);
		PageInfo<Card> pu = new PageInfo<Card>(list);
		return pu;
	}
	
	public PageInfo<Card> getCardListToRegisterIdAndLikeProjectName(Integer registerId,String projectName,int page,int pageSize){
		PageHelper.startPage(page,pageSize);
		List<Card> list = cardMapper.getCardListToRegisterIdAndLikeProjectName(registerId,projectName);
		PageInfo<Card> pu = new PageInfo<Card>(list);
		return pu;
	}
	
	public PageInfo<Card> getHistoryCardListToRegisterIdAndLikeProjectName(Integer registerId,String projectName,int page,int pageSize){
		PageHelper.startPage(page,pageSize);
		List<Card> list = cardMapper.getHistoryCardListToRegisterIdAndLikeProjectName(registerId,projectName);
		PageInfo<Card> pu = new PageInfo<Card>(list);
		return pu;
	}
	
	public Card getCardToTelephone(String telephone){
		return cardMapper.getCardToTelephone(telephone);
	}
	
	public Card getCardToEmail(String email){
		return cardMapper.getCardToEmail(email);
	}
	
	public CardBO get(Integer id){
		return cardMapper.get(id);
	}
	
	
}
