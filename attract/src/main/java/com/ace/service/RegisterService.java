package com.ace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.dao.RegisterMapper;
import com.ace.entity.Register;

@Service("registerService")
public class RegisterService extends BaseService<Register>{
	@Autowired
	private RegisterMapper registerMapper;
	
	public Register getRegisterToTelephone(String telephone){
		return registerMapper.getRegisterToTelephone(telephone);
	}
	
	public Register getRegisterToWechatId(String wechatId){
		return registerMapper.getRegisterToWechatId(wechatId);
	}
	
}
