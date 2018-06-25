package com.ace.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ace.entity.Message;
import com.github.abel533.mapper.Mapper;

public interface MessageMapper extends Mapper<Message>{

	public List<Message> getMessageListToRegisterId(@Param("registerId") Integer registerId);

}
