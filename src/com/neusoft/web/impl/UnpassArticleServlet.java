package com.neusoft.web.impl;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;



public class UnpassArticleServlet extends ArticleControllerSupport
{
       @Override
       public String execute() throws Exception
       {
    	   this.update("unpassArticle", "��˷�");
    	   return "readArticle";
       }


}
