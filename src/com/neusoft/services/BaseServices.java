package com.neusoft.services;

import java.util.List;
import java.util.Map;
public interface BaseServices 
{
     void setMapDto(Map<String,Object> dto);
     
     /**
      * 接口的默认实现
      * @return
      * @throws Exception
      */

     /**s
      * 接口的默认实现
      * @return
      * @throws Exception
      */
     default Map<String,Object> findById()throws Exception
     {
    	 return null;
     }

     default List<Map<String,Object>> FBIforMore()throws Exception
     {
    	 return null;
     }
     
     default List<Map<String,Object>> adminQueryArticle()throws Exception

     {
    	 return null;
     }
     
     default  String getMessage() 
 	 {
 		return null;
 	 }
    
     default List<Map<String,Object>> query()throws Exception
     {
    	 return null;
     }

     default List<Map<String,Object>> adminQuery()throws Exception
     {
    	 return null;
     }
     
     default List<Map<String,Object>> queryBuyOrder()throws Exception
     {
    	 return null;
     }
     
     default List<Map<String,Object>> querySellOrder()throws Exception
     {
    	 return null;
     }
	
	default boolean psnAddComplaint()throws Exception
	{
		return false;
	}

	default List<Map<String, Object>> adminQueryComplain() throws Exception
	{
		return null;
	}

	 default Map<String, Object> loginEmp() throws Exception
	 {
		 return null;
	 }
	 default int logonPerson() throws Exception
	 {
		return 0;
	 }

	
     default Map<String,Object> queryPersonEmp()throws Exception
     {
    	return null;
     }

	 default boolean personUpdateEmp()throws Exception
	 {
		return false;
	 }

}
