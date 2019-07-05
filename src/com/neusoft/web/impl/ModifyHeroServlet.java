package com.neusoft.web.impl;

public class ModifyHeroServlet extends HeroControllerSupport {


	@Override
	public String execute() throws Exception {
		this.update("modifyHero", "ÐÞ¸Ä");
		return "addHero";
	}

}
