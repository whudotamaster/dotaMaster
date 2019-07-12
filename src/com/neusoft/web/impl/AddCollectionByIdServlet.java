package com.neusoft.web.impl;

import com.sun.javafx.collections.MappingChange.Map;

import sun.applet.resources.MsgAppletViewer;

public final class AddCollectionByIdServlet extends CollectionControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addCollectionById", " ’≤ÿ");
		this.postOnLoad();
		return "post";
	}
}
