package com.neusoft.web.impl;

public class DelHeroServlet extends HeroControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("batchDeleteHero", "ɾ��");
		this.savePageDataForDelete();
		return "queryHero";
	}

}
