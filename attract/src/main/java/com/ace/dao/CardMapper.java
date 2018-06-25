package com.ace.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ace.controller.phone.bo.CardBO;
import com.ace.entity.Card;
import com.github.abel533.mapper.Mapper;


public interface CardMapper extends Mapper<Card>{
	public List<Card> getCardListLikeCompanyName(@Param("companyName") String companyName);
	public List<Card> getCardListToRegisterIdAndLikeCompanyName(@Param("registerId") Integer registerId,@Param("companyName") String companyName);
	public List<Card> getHistoryCardListToRegisterIdAndLikeCompanyName(@Param("registerId") Integer registerId,@Param("companyName") String companyName);

	public List<Card> getCardListToParentIdLikeProjectName(@Param("parentId") Integer parentId,@Param("projectName") String projectName);
	public List<Card> getCardListLikeProjectName(@Param("projectName") String projectName);
	public List<Card> getCardListToRegisterIdAndLikeProjectName(@Param("registerId") Integer registerId,@Param("projectName") String projectName);
	public List<Card> getHistoryCardListToRegisterIdAndLikeProjectName(@Param("registerId") Integer registerId,@Param("projectName") String projectName);
	
	public Card getCardToTelephone(@Param("telephone") String telephone);
	public Card getCardToEmail(@Param("email") String email);
	public CardBO get(@Param("id") Integer id);
	
	public List<CardBO> getCardList();
	
}
