package com.neusoft.services;

import java.util.List;
import java.util.Map;

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

public interface BaseServices 
{
     void setMapDto(Map<String,Object> dto);
     
     /**
      * �ӿڵ�Ĭ��ʵ��
      * @return
      * @throws Exception
      */

     /**s
      * �ӿڵ�Ĭ��ʵ��
      * @return
      * @throws Exception
      */
     default Map<String,String> findById()throws Exception
     {
    	 return null;
     }

     
     default List<Map<String,String>> query()throws Exception
     {
    	 return null;
     }

	default List<Map<String, String>> queryHero()throws Exception
	{
		return null;
	}

	default Map<String, String> findByIdHero()throws Exception
	{
		return null;
	}
}
