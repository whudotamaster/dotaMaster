package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class ModifyCompServlet extends CompControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("announceResult", "ÐÞ¸Ä");
		return "announceResult";
	}

}
