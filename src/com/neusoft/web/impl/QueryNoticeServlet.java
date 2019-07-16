package com.neusoft.web.impl;


public class QueryNoticeServlet extends NoticeControllerSupport
{
       @Override
       public String execute() throws Exception
       {
    	   this.query("queryNotice");
    	   return "queryNotice";
       }
}
