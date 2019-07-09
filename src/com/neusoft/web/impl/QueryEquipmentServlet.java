package com.neusoft.web.impl;

public class QueryEquipmentServlet extends EquipmentControllerSupport {	
	@Override
	public String execute() throws Exception
	{
	    this.savePageData();
		return "queryEquipment";
	}

}
