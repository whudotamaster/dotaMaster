package com.neusoft.web.impl;

import com.sun.javafx.collections.MappingChange.Map;

import sun.applet.resources.MsgAppletViewer;

public final class DelHistoryServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delPost","�h��");
		this.queryHistoryOnLoad();
		return "queryHistoryPost";
	}
}
