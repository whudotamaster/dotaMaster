<<<<<<< HEAD
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
    function collecttion(vaab501,collection)
      {
    	  var vform = document.getElementById("myform");
    	  if(${rows[1].collection})
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
      	 var vform = document.getElementById("myform");
     
      	 vform.action="<%=path%>/reward.html?aab501="+vaab501+"&paab101="+paab101;

      	 //alert(vform.action);
      	 vform.submit();
      }
     
      function onDel(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delPost.html?aab501=" + vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      } 
   </script>
</head>
<body>
<br>
�ղ�״̬${rows[1].collection}
${msg }
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
	    	   	  <tr>
				    <td>1</td>
				    <td>
					<!-- #  �û�����ͷ��--> 
								<a href="#" onclick="onEdit('${rows[0].aab101}')">${rows[0].aab102 }</a>
								<img src=<%=path%>/images/${rows[0].aab105 } class="round_icon"
								onclick="onEdit('${rows[0].aab101}')">
				    </td>
				    <td>${rows[0].aab502 }</td>
				    <td>${rows[0].aab503 }
				    <c:choose>
				   	<c:when test="<%=aab101!=null %>">
				       <input type="button" value="����" 
				       onclick="rewrad('${param.aab501 }','${rows[0].aab101}')"
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
				    <td>${rows[0].aab504 }</td>
				  </tr>
				  </table>
				  <table  border="1" width="95%" align="center">
				  	  <tr>
	    <td>����</td>
	    <td>�ظ���</td>
	    <td>�ظ�����</td>
	    <td>ʱ��</td>
	  </tr>
		      <!-- ������� -->
		    <c:forEach items="${rows }" var="ins" varStatus="vs">
		    <c:if test="${vs.count >2 }">
			          <tr>
			            <td>${ins.aab602+1 }</td>
			            	<td>
								<!-- #  �û�����ͷ��--> 
								 <a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
								<img src=<%=path%>/images/${ins.aab105 } class="round_icon"
								onclick="onEdit('${ins.aab101}')">
							</td>
			            <td>${ins.aab603 }</td>
			            <td>${ins.aab604 }</td>
			          </tr>
			          </c:if>
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
  			  <input type="submit" name="next" value="�ظ� ">
     </c:when>
     <c:otherwise>
       <input type="submit" name="next" value="��¼ "
              formaction="<%=path%>/login.html">
     </c:otherwise>
     </c:choose>
	             <input type="submit" name="next" value="����" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
	       <input type="button" id="del" name="next" value="ɾ��" 
	              onclick="onDel('${param.aab501}')" 
	              formnovalidate="formnovalidate" >
	    </td>
	  </tr>
	</table>
  <e:hidden name="aab101" defval="<%=aab101 %>"/>
</form>
</body>
=======
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
   
</head>
<body>
<%@ include file="header.jsp" %>
<br>
${msg }
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
	    <td>����޸�ʱ��</td>
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
	    	   	  <tr>
				    <td>1</td>
				    <td>
					<!-- #  �û�����ͷ��--> 
								<a href="#" onclick="onEdit('${rows[0].aab101}')">${rows[0].aab102 }</a>
								<img src=<%=path%>/images/${rows[0].aab105 } class="round_icon"
								onclick="onEdit('${rows[0].aab101}')">
				    </td>
				    <td>${rows[0].aab502 }</td>
				    <td>${rows[0].aab503 }
				    <c:choose>
				   	<c:when test="<%=aab101!=null %>">
				       <input type="button" value="����" 
				       onclick="rewrad('${param.aab501 }','${rows[0].aab101}')"
				            formnovalidate="formnovalidate" >
				 	   <input type="button" value="�ղ�" 
				 	       onclick="collecttion('${param.aab501 }')"
				 	       formnovalidate="formnovalidate"> 
				 	       <a>����${rows[3].countlike }��</a>
				 	   <input type="button" value="����" 
				       	   onclick="like('${param.aab501 }')"
				           formnovalidate="formnovalidate" >
				    </c:when>
				    <c:otherwise>
				      <input type="submit" value="����" formaction="<%=path%>/login.html"
				          formnovalidate="formnovalidate">
				 	   <input type="submit" value="�ղ�" formaction="<%=path%>/login.html"
				 	       formnovalidate="formnovalidate"> 
				 	            ${rows[3].countlike }
				 	   <input type="submit" value="����" formaction="<%=path%>/login.html"
				           formnovalidate="formnovalidate" >
				    </c:otherwise>
					</c:choose>
				    </td>
				    <td>${rows[0].aab504 }</td>
				  </tr>
				  </table>
				  <table  border="1" width="95%" align="center">
				  	  <tr>
	    <td>����</td>
	    <td>�ظ���</td>
	    <td>�ظ�����</td>
	    <td>ʱ��</td>
	  </tr>
		      <!-- ������� -->
		    <c:forEach items="${rows }" var="ins" varStatus="vs">
		    <c:if test="${vs.count >4 }">
			          <tr>
			            <td>${ins.aab602+1 }</td>
			            	<td>
								<!-- #  �û�����ͷ��--> 
								 <a href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
								<img src=<%=path%>/images/${ins.aab105 } class="round_icon"
								onclick="onEdit('${ins.aab101}')">
							</td>
			            <td>${ins.aab603 }</td>
			            <td>${ins.aab604 }</td>
			          </tr>
			          </c:if>
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
  			  <input type="submit" name="next" value="�ظ� ">
     </c:when>
     <c:otherwise>
       <input type="submit" name="next" value="��¼ "
              formaction="<%=path%>/login.html"
               formnovalidate="formnovalidate">
     </c:otherwise>
     </c:choose>
	             <input type="submit" name="next" value="����" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
              <c:if test="${aab108 == 2 || aab101 == rows[0].aab101 }">
	       <input type="button" id="del" name="next" value="ɾ��" 
	              onclick="onDel('${param.aab501}')" 
	              formnovalidate="formnovalidate" >
              </c:if>
	    </td>
	  </tr>
	</table>
  <e:hidden name="aab101" defval="<%=aab101 %>"/>
</form>
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
    function collecttion(vaab501,collection)
      {
    	  var vform = document.getElementById("myform");
    	  if(${rows[1].collection})
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
      	 var vform = document.getElementById("myform");
     
      	 vform.action="<%=path%>/reward.html?aab501="+vaab501+"&paab101="+paab101;

      	 //alert(vform.action);
      	 vform.submit();
      }
     
      function onDel(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delPostById.html?aab501=" + vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
      function like(vaab501)
      {	
    	  var vform = document.getElementById("myform");
    	  if(${rows[2].like})
    	  {
    		  vform.action="<%=path%>/delLike.html?aab501="+vaab501;
    		  alert("dislike");
    	  }
    	  else
    	  {
    		  vform.action="<%=path%>/addLike.html?aab501="+vaab501;
    		  alert("like");
    	  }
    	  vform.submit();
      }
   </script>
>>>>>>> branch 'dev' of git@github.com:whudotamaster/dotaMaster.git
</html>