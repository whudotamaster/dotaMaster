package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class EmpControllerSupport extends ControllerSupport
{
	public EmpControllerSupport() 
	{
		System.out.println("EmpControllerSupport�ɹ�����");
		this.setServices(new Ab01ServicesImpl());
	}
}
