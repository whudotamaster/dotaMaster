package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class LoginServlet  extends EmpControllerSupport {
	@Override
	public String execute() throws Exception 
	{
		return this.loginIn()?"mainPage":"login";
	}
}
