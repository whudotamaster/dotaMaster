package com.neusoft.web.impl;

public class DelByIdPlayerServlet extends PlayerControllerSupport {


	@Override
	public String execute() throws Exception
	{
		this.update("delByIdPlayer", "É¾³ý");
		this.savePageDataForDelete();
		return "queryPlayer";
	}

}
