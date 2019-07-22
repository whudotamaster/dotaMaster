package com.neusoft.web.impl;

import java.util.HashMap;
import java.util.Map;

import com.neusoft.services.impl.Ab08ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class AdminGoServlet extends AdminControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
        Map<String,Object> ins = new HashMap<String,Object>();
		ins.put("articleCount", this.executeCountMethod("countArticle"));
		ins.put("complainCount", this.executeCountMethod("countComplain"));
		ins.put("sendAccCount", this.executeCountMethod("countSendAcc"));
		ins.put("getAccCount", this.executeCountMethod("countGetAcc"));
		ins.put("matchCount", this.executeCountMethod("countMatch"));
		this.saveAttribute("ins", ins);
		return "adminGo";
	}

}
