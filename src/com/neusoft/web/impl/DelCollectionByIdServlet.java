package com.neusoft.web.impl;

import com.sun.javafx.collections.MappingChange.Map;

import sun.applet.resources.MsgAppletViewer;

public final class DelCollectionByIdServlet extends ForumControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCollectionById", " ’≤ÿ");
		this.postOnLoad();
		return "post";
	}
}
