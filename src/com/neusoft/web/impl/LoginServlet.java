package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class LoginServlet  extends EmpControllerSupport {
	@Override
	public String execute() throws Exception 
	{

		this.loginIn();//向页面传递ins
		System.out.println("loginIn成功运行");
		return this.loginIn()?"mainPage":"login";
	}
}
