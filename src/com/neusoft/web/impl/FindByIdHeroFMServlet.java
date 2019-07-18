package com.neusoft.web.impl;

public class FindByIdHeroFMServlet extends HeroControllerSupport {

	
	@Override
	public String execute() throws Exception 
	{
		this.savePageData("FBIforMore");
		this.findById("findByIdSkill");
		return "readHero";
	}

}
