package com.neusoft.web.impl;

public class FindByIdHeroFMServlet extends HeroControllerSupport {

	
	@Override
	public String execute() throws Exception 
	{
		
		this.savePageInstance();
		return "readHero";
	}
}
