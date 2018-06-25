package com.ace.util;

import java.util.ArrayList;
import java.util.List;

import com.ace.controller.admin.bo.DemandBO;

/**
 * 系统静态字段
 * @author hack
 *
 */
public class Resource {
	public static final String ADMIN = "admin";
	public static final String PASSWORD = "123456";
	public static final String N = "N";
	public static final String Y = "Y";
	public static final String W = "W";
	
	public static final List<DemandBO> DEMANDS = new ArrayList<DemandBO>(){{
		add(new DemandBO("融资服务"));
		add(new DemandBO("生产服务"));
		add(new DemandBO("区域服务"));
	}};
	
	public final static List<KeyValue> STAGES = new ArrayList<KeyValue>(){{
		add(new KeyValue("初创期", "初创期（试验阶段）"));
		add(new KeyValue("成长期", "成长期（中试、临床前阶段）"));
		add(new KeyValue("成熟期", "成熟期（申报、临床阶段）"));
	}};
	
	
}
