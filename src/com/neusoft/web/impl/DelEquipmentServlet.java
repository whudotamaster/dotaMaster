package com.neusoft.web.impl;

public class DelEquipmentServlet extends EquipmentControllerSupport {


	@Override
	public String execute() throws Exception 
	{
		this.update("batchDeleteEquipment", "ɾ��");
		this.savePageDataForDelete();
		return "queryEquipment";
	}

}
