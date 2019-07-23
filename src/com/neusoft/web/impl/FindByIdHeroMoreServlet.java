package com.neusoft.web.impl;

public class FindByIdHeroMoreServlet extends HeroControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		
		this.savePageInstance();
		return "updateHero";
	}
}
