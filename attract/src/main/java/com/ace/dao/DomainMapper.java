package com.ace.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ace.entity.Domain;
import com.github.abel533.mapper.Mapper;

public interface DomainMapper extends Mapper<Domain>{
	public List<Domain> getDomainParentList();
	public List<Domain> getDomainChildsToParentId(@Param("parentId") int parentId);
	public Domain getDomainChildToName(@Param("name") String name);
}
