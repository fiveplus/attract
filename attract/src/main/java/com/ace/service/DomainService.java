package com.ace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.dao.DomainMapper;
import com.ace.entity.Domain;

@Service("domainService")
public class DomainService extends BaseService<Domain>{
	@Autowired
	private DomainMapper domainMapper;
	
	public List<Domain> getDomainParentList(){
		return domainMapper.getDomainParentList();
	}
	
	public List<Domain> getDomainChildsToParentId(int parentId){
		return domainMapper.getDomainChildsToParentId(parentId);
	}
	
	public Domain getDomainChildToName(String name){
		return domainMapper.getDomainChildToName(name);
	}
	
	
}
