<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();
String aab101=(String)session.getAttribute("aab101");
%>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
     .round_icon {
	width: 34px;
	height: 34px;
	display: flex;
	border-radius: 50%;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}
   </style>
   
   <script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEmp.html?aab101="+vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function collecttion(vaab501,collection)
      {
    	  var vform = document.getElementById("myform");
    	  if(collection == "true")
    	  {
    		  vform.action="<%=path%>/delCollectionById.html?aab501="+vaab501;
    		  alert("�h���ղ�");
    	  }
    	  else
    	  {
    		  vform.action="<%=path%>/addCollectionById.html?aab501="+vaab501;
    		  alert("�����ղ�");
    	  }
    	  vform.submit();
      }
      
      function rewrad(vaab501,paab101)
      {	
    	  if(${money>=5 })
      	 {
      	 var vform = document.getElementById("myform");
     
      	 vform.action="<%=path%>/reward.html?aab501="+vaab501+"&paab101="+paab101;

      	 //alert(vform.action);
      	 vform.submit();
      	 }
      	 else
     	{
     		alert("����");		
     	 }
      }
     
      
   </script>
</head>
<body>
<br>
�Ñ����~
${money }
${collection }
<br>
<form id="myform" action="<%=path%>/addComment.html?aab501=${param.aab501 }" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
	               ������ϸҳ��
	    <hr width="160">
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>����</td>
	    <td>������</td>
	    <td>����</td>
	    <td>����</td>
	    <td>ʱ��</td>
	  </tr>
	  <!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count -1 }</td>
				    <td>
					<!-- #  �û�����ͷ��--> 
								<a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
								<img src=<%=path%>/images/${ins.aab105 } class="round_icon"
								onclick="onEdit('${ins.aab101}')">
				    </td>
				    <td>${ins.aab502 }</td>
				    <td>${ins.aab503 }
				    <c:choose>
				   	<c:when test="<%=aab101!=null %>">
				       <input type="button" value="����" 
				       onclick="rewrad('${param.aab501 }','${ins.aab101}')"
				            formnovalidate="formnovalidate" >
				 	   <input type="button" value="�ղ�" 
				 	       onclick="collecttion('${param.aab501 }','${collection}')"
				 	       formnovalidate="formnovalidate"> 
				    </c:when>
				    <c:otherwise>
				      <input type="submit" value="����" formaction="<%=path%>/login.html"
				          formnovalidate="formnovalidate">
				 	   <input type="submit" value="�ղ�" formaction="<%=path%>/login.html"
				 	       formnovalidate="formnovalidate"> 
				    </c:otherwise>
					</c:choose>
				    </td>
				    <td>${ins.aab504 }</td>
				  </tr>
				  </table>
				  <table  border="1" width="95%" align="center">
				  	  <tr>
	    <td>����</td>
	    <td>�ظ���</td>
	    <td>�ظ�����</td>
	    <td>ʱ��</td>
	  </tr>
		      </c:forEach>
		      <!-- ������� -->
		    <c:forEach items="${comment }" var="ins" varStatus="vs">
			          <tr>
			            <td>${ins.aab602 }</td>
			            	<td>
								<!-- #  �û�����ͷ��--> 
								 <a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
								<img src=<%=path%>/images/${ins.aab105 } class="round_icon"
								onclick="onEdit('${ins.aab101}')">
							</td>
			            <td>${ins.aab603 }</td>
			            <td>${ins.aab604 }</td>
			          </tr>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	     <tr>
     <td>�ظ�</td>
     <td>
       <textarea rows="5" cols="45" name="acaab603" required="true"></textarea>
     </td>
   </tr>
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <c:choose>
  			 <c:when test="<%=aab101!=null %>">
  			  <input type="submit" name="next" value="�ظ� "
              formaction="<%=path%>/addComment.html">
     </c:when>
     <c:otherwise>
       <input type="submit" name="next" value="��¼ "
              formaction="<%=path%>/login.html">
     </c:otherwise>
     </c:choose>
	             <input type="submit" name="next" value="����" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
	       <input type="submit" id="del" name="next" value="ɾ��" 
	              formaction="<%=path%>/delEmp.html"  disabled="disabled">
	    </td>
	  </tr>
	</table>
  <e:hidden name="aab101" defval="<%=aab101 %>"/>
  <input type="number" hidden="true" name="aab106" value="${money }">
</form>
</body>
</html>