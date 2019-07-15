package com.neusoft.web.impl;

public class DelByIdEquipmentServlet extends EquipmentControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("deleteByIdEquipment", "É¾³ý");
		this.savePageDataForDelete();
		return "queryEquipment";
	}

}
