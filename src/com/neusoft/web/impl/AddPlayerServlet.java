package com.neusoft.web.impl;

public class AddPlayerServlet extends PlayerControllerSupport {

	

	@Override
	public String execute() throws Exception 
	{
		this.update("addPlayer", "添加", "添加成功，该选手为", "aac1002");
		return "addPlayer";
	}

}
