package com.ace.controller.admin.bo;

import java.io.Serializable;

public class DemandBO implements Serializable{
	private String name;
	private boolean checked;
	
	public DemandBO(){}
	public DemandBO(String name){
		this.name = name;
		this.checked = false;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
}
