package com.neusoft.web.impl;

public class DelEquipmentServlet extends EquipmentControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.update("batchDeleteEquipment", "É¾³ý");
		this.savePageDataForDelete();
		return "queryEquipment";
	}

}
