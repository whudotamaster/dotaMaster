package com.neusoft.web.impl;

public class FindByIdComplainServlet extends ComplainControllerSupport
{
       @Override
       public String execute()throws Exception
       {
    	   this.savePageInstance();
    	   return "readComplain";
       }


}
