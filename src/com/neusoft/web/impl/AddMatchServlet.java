package com.neusoft.web.impl;

public class AddMatchServlet extends MatchControllerSupport {



	@Override
	public String execute() throws Exception
	{
		this.update("addMatch", "添加", "添加比赛成功,该比赛开始时间为：", "aac1102");
		return "addMatch";
	}

}
