package com.neusoft.web.impl;

public class AddEquipmentServlet extends EquipmentControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("addEquipment", "���", "��ӳɹ�����װ��Ϊ��", "aac502");
		return "addEquipment";
	}

}
