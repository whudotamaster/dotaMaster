package com.neusoft.web.impl;

public class AddEventServlet extends EquipmentControllerSupport {


	@Override
	public String execute() throws Exception
	{
		this.update("addEvent", "���", "��ӳɹ���������Ϊ��", "aac702");
		return "addEvent";
	}

}
