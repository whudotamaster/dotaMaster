package com.neusoft.web.impl;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;


public class QueryPersonServlet extends EmpControllerSupport 
{
	@Override
	public String execute()throws Exception
	{
		System.out.println("QPS运行");
		this.queryPersonIn();
		System.out.println("QPI运行");


	  return  "updatePersonInfo";
	}
}
