package com.neusoft.web.impl;

public class DelByIdEquipmentServlet extends EquipmentControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("deleteByIdEquipment", "ɾ��");
		this.savePageDataForDelete();
		return "queryEquipment";
	}

}
