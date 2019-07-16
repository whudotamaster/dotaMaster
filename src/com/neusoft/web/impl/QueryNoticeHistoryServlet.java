package com.neusoft.web.impl;


public class QueryNoticeHistoryServlet extends NoticeControllerSupport
{
       @Override
       public String execute() throws Exception
       {
    	   this.query("queryHistory");
    	   return "queryNoticeHistory";
       }
}
