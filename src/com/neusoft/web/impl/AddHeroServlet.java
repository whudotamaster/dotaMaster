package com.neusoft.web.impl;

public class AddHeroServlet extends HeroControllerSupport {

	
	@Override
	public String execute() throws Exception {
		this.update("addHero", "���", "��ӳɹ�����Ӣ����", "aac102");
		return "addHero";
	}

}
