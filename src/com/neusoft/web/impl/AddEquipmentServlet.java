package com.neusoft.web.impl;

public class AddEquipmentServlet extends EquipmentControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("addEquipment", "添加", "添加成功，该装备为：", "aac502");
		return "addEquipment";
	}

}
