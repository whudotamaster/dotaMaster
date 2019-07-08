package com.neusoft.web.impl;

public class FindByIdHeroServlet extends HeroControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "addHero";
	}

}
