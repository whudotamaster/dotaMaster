package com.neusoft.web.impl;



public class UpdtPsnPwdServlet extends EmpControllerSupport
{
   @Override
   public String execute() throws Exception
   {
	   this.update("updatePassword","ĞŞ¸ÄÃÜÂë");
	   return "changePassword";
   }
}
