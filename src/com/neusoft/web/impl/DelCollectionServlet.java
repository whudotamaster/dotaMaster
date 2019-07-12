package com.neusoft.web.impl;

import com.sun.javafx.collections.MappingChange.Map;

import sun.applet.resources.MsgAppletViewer;

public final class DelCollectionServlet extends CollectionControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCollection", " ’≤ÿ");
		this.collectionOnLoad();
		return "queryCollection";
	}
}
