package com.neusoft.web.impl;



public class UpdtPsnPwdServlet extends PersonControllerSupport
{
   @Override
   public String execute() throws Exception
   {
	   this.update("updatePassword","�޸�����");
		this.queryMap("queryPerson");	
	   return "updatePersonInfo";
   }
}
