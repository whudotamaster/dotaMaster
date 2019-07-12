package com.neusoft.web.impl;

public class AddHeroServlet extends HeroControllerSupport {

	
	@Override
	public String execute() throws Exception {
		this.update("addHero", "添加", "添加成功，该英雄是", "aac102");
		return "addHero";
	}

}
