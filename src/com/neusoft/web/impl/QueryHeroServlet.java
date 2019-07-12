package com.neusoft.web.impl;

public class QueryHeroServlet extends HeroControllerSupport {


	@Override
	public String execute() throws Exception {
		
		this.savePageData();
		return "queryHero";
	}

}
