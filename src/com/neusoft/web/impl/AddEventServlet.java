package com.neusoft.web.impl;

public class AddEventServlet extends EquipmentControllerSupport {


	@Override
	public String execute() throws Exception
	{
		this.update("addEvent", "添加", "添加成功，该赛事为：", "aac702");
		return "addEvent";
	}

}
