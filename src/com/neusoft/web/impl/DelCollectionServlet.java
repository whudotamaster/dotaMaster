package com.neusoft.web.impl;

import com.sun.javafx.collections.MappingChange.Map;

import sun.applet.resources.MsgAppletViewer;

public final class DelCollectionServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCollection", "ɾ���ղ�");
		this.postOnLoad();
		return "queryCollection";
	}
}
