package com.neusoft.web.impl;

public class ModifyPlayerServlet extends PlayerControllerSupport {


	@Override
	public String execute() throws Exception
	{
		this.update("modifyPlayer", "�޸�");
		return "readPlayer";
	}

}
