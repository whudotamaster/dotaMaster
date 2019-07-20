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

     
     default  String getMessage() 
 	 {
 		return null;
 	 }
    
     default List<Map<String,Object>> query()throws Exception
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
	
	default boolean insert()throws Exception
	{
		return false;
	}
	


}
