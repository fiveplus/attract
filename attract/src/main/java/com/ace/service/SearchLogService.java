package com.ace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.dao.SearchLogMapper;
import com.ace.entity.SearchLog;

@Service("searchLogService")
public class SearchLogService extends BaseService<SearchLog>{
	@Autowired
	private SearchLogMapper searchLogMapper;
	
	public SearchLog getSearchLogToRegisterIdAndCardId(Integer registerId,Integer cardId){
		return searchLogMapper.getSearchLogToRegisterIdAndCardId(registerId,cardId);
	}
	
	
}
