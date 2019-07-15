package com.neusoft.web.impl;

public class ModifyEquipmentServlet extends EquipmentControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("modifyEquipment", "ÐÞ¸Ä");
		return "addEquipment";
	}

}
