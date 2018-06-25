package com.ace.dao;

import org.apache.ibatis.annotations.Param;

import com.ace.entity.SearchLog;
import com.github.abel533.mapper.Mapper;

public interface SearchLogMapper extends Mapper<SearchLog> {
	public SearchLog getSearchLogToRegisterIdAndCardId(@Param("registerId") Integer registerId,@Param("cardId") Integer cardId);
}
