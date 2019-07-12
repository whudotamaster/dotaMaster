<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
</head>
<body>
<%@ include file="header.jsp" %>
${msg }
<br>
<%=session.getId() %>
<br>
<form id="myform" action="<%=path%>/queryTeam.html" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="35%" align="center">
	  <caption>
	            ս����Ϣ
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>ս����</td>
	    <td>
	      <e:text name="qaac902"/>
	    </td>
	  </tr>	 
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td>���</td>
	    <td>ս��ͼ��</td>
	    <td align="center">ս����</td>
	    
	  
	   
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td style="width:15%; height:15%">${vs.count }</td>
				     <td  align="center" style="width:15%; height:15%">
				       <img alt="no image" src=<%=path%>/images/${ins.aac903 } style="width:100%; height:100%">
				     </td>
				    <td align="center">
				      <!-- #  ��ê -->
				     <a  href="#" onclick="onEdit('${ins.aac901}')">${ins.aac902 }</a>
				    </td>   
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
			          <tr>
			            <td></td>
			            <td></td>
			            <td></td>
			            
			          		            
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="15">
	           <tr>
	             <td></td>
	             <td></td>
	             <td></td>
	             
	                           
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- ���ܰ�ť�� -->
	<table border="1" width="35%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ">
	       <input type="submit" name="next" value="����" 
	              formaction="<%=path%>/addTeam.jsp">
	      
	    </td>
	  </tr>
	</table>
</form>
</body>
<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaac901)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdTeam.html?aac901="+vaac901;
    	 //alert(vform.action);
    	 vform.submit();
      }
      function onDel(vaac901)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdTeam.html?aac901="+vaac901;
    	 //alert(vform.action);
    	 vform.submit();
      }    
   </script>  
</html>