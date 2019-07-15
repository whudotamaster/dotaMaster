package com.neusoft.web.impl;

public class ModifyMatchServlet extends MatchControllerSupport {



	@Override
	public String execute() throws Exception 
	{
		this.update("modifyMatch", "ÐÞ¸Ä");;
		return "readMatch";
	}

}
