package com.neusoft.web.impl;

public class DelByIdHeroServlet extends HeroControllerSupport {

	
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteByIdHero", "ɾ��");
		this.savePageDataForDelete();
		return "queryHero";
	}

}
