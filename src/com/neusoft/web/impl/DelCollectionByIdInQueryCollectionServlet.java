package com.neusoft.web.impl;

import com.sun.javafx.collections.MappingChange.Map;

import sun.applet.resources.MsgAppletViewer;

public final class DelCollectionByIdInQueryCollectionServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCollectionById", "ɾ���ղ�");
		this.collectionOnLoad();
		return "queryCollection";
	}
}
