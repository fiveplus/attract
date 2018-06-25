package com.ace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.dao.SysLogMapper;
import com.ace.entity.SysLog;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("sysLogService")
public class SysLogService extends BaseService<SysLog>{
	@Autowired
	private SysLogMapper sysLogMapper;
	
	public PageInfo<SysLog> getSysLogList(int page,int pageSize){
		PageHelper.startPage(page,pageSize);
		List<SysLog> list = queryAll();
		PageInfo<SysLog> pu = new PageInfo<SysLog>(list);
		return pu;
	}
}
