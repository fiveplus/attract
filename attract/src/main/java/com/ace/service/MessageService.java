package com.ace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.dao.MessageMapper;
import com.ace.entity.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("messageService")
public class MessageService extends BaseService<Message>{
	@Autowired
	private MessageMapper messageMapper;
	
	public PageInfo<Message> getMessageListToRegisterId(Integer registerId,int page,int pageSize){
		PageHelper.startPage(page, pageSize);
		List<Message> list = messageMapper.getMessageListToRegisterId(registerId);
		PageInfo<Message> pu = new PageInfo<Message>(list);
		return pu;
	}
	
}
