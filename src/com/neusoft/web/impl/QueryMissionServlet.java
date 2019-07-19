package com.neusoft.web.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.impl.Ab10ServicesImpl;


public class QueryMissionServlet  extends MissionControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "queryMission";
	}

}
