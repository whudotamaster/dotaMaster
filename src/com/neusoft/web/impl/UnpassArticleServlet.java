package com.neusoft.web.impl;

public class UnpassArticleServlet extends ArticleControllerSupport
{
       @Override
       public String execute() throws Exception
       {
    	   this.update("unpassArticle", "…Û∫À∑Ò∂®");
    	   return "readArticle";
       }
}
