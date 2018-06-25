package com.ace.dao;

import org.apache.ibatis.annotations.Param;

import com.ace.entity.Register;
import com.github.abel533.mapper.Mapper;

public interface RegisterMapper extends Mapper<Register>{
	public Register getRegisterToTelephone(@Param("telephone") String telephone);
	public Register getRegisterToWechatId(@Param("wechatId") String wechatId);
}
