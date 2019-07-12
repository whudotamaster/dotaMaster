package com.neusoft.web.impl;

public class FindByIdEquipmentServlet extends EquipmentControllerSupport {
	@Override
	public String execute() throws Exception
	{

        this.savePageInstance();
		return "addEquipment";
	}

}
