package com.neusoft.web.impl;
public class AddComplainServlet extends ComplainControllerSupport
{
	  @Override
	  public String execute()throws Exception
	  {
		  this.update("psnAddComplaint","Ͷ��");
		  return "compToAdmin";
	  }
  
}
