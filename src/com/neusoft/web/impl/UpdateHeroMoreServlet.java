package com.neusoft.web.impl;

public class UpdateHeroMoreServlet extends HeroControllerSupport
{
       @Override
       public String execute() throws Exception
       {
    	   this.update("modifySAT", "�޸�");
    	   this.savePageInstance();
    	   return "updateHero";
       }
}
