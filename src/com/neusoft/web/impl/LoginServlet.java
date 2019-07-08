package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class LoginServlet  extends EmpControllerSupport {
	@Override
	public String execute() throws Exception 
	{
		System.out.println("login in BaseServices成功运行");
	this.saveAttribute("msgs", this.getAttribute().get("aab102"));
		return this.loginIn()?"mainPage":"login";
	}
}
