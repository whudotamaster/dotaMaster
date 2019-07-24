package com.neusoft.web.impl;

public class UpdateHeroMoreServlet extends HeroControllerSupport
{
       @Override
       public String execute() throws Exception
       {
    	   this.update("modifySAT", "ÐÞ¸Ä");
    	   this.savePageInstance();
    	   return "updateHero";
       }
}
