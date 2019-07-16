package com.neusoft.web.impl;


public class QueryNoticeHistoryServlert extends NoticeControllerSupport
{
       @Override
       public String execute() throws Exception
       {
    	   this.query("queryHistory");
    	   return "queryNoticeHistory";
       }
}
