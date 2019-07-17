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
${rows }
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
								<a href="#" onclick="onEdit('${rows[1].aab101}')">${rows[1].aab102 }</a>
								<img src=<%=path%>/images/${rows[1].aab105 } class="round_icon"
								onclick="onEdit('${rows[1].aab101}')">
				    </td>
				    <c:if test="${(rows[0].aab107)/100 >= rows[1].aab507+0 || rows[1].aab101 == aab101}">
				    <td>${rows[1].aab502 }</td>
				    <td>${rows[1].aab503 }
				     <c:choose>
				   	<c:when test="<%=aab101!=null %>">
				       <input type="button" value="����" 
				       onclick="rewrad('${param.aab501 }','${rows[1].aab101}')"
				            formnovalidate="formnovalidate" >
				 	   <input type="button" value="�ղ�" 
				 	       onclick="collecttion('${param.aab501 }')"
				 	       formnovalidate="formnovalidate"> 
				 	       <a>����${rows[0].countlike }��</a>
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
				    </c:if>
				    <c:if test="${(rows[0].aab107)/100 < rows[1].aab507+0 && rows[1].aab101 != aab101}">
				     <td><a style="color:#FF2222 ">------����Ҫ${rows[0].aab507}�������ϲ��ܹۿ�������------</a></td>
				     <td><a style="color:#FF2222 ">------����Ҫ${rows[0].aab507}�������ϲ��ܹۿ�������------</a></td>
				    </c:if>
				    <td>${rows[1].aab504 }</td>
				  </tr>
				  </table>
				  <c:if test="${(rows[0].aab107)/100 >= rows[1].aab507+0 || rows[1].aab101 == aab101}">
				  <table  border="1" width="95%" align="center" class="table table-striped">
				  	  <tr>
	    <td>����</td>
	    <td>�ظ���</td>
	    <td>�ظ�����</td>
	    <td>ʱ��</td>
	  </tr>
		      <!-- ������� -->
		    <c:forEach items="${rows }" var="ins" varStatus="vs" begin="2" end="11">
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
		      </c:forEach>
		      </c:if>
	     </c:when>
	   </c:choose>
	   <c:if test="${(rows[0].aab107)/100 >=  rows[1].aab507+0 || rows[1].aab101 == aab101}">
	     <tr>
     <td>�ظ�</td>
     <td colspan="3">
       <textarea rows="5" cols="135	" name="acaab603" required="true"></textarea>
     </td>
   </tr>
   </c:if>
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
  			 <c:if test="${aab101 != null && (rows[0].aab107)/100 >= rows[1].aab507+0 || rows[1].aab101 == aab101}">
  			  <input type="submit" name="next" value="�ظ� ">
     </c:if>
     <c:if test="${aab101 == null}">
       <input type="submit" name="next" value="��¼ "
              formaction="<%=path%>/login.html"
               formnovalidate="formnovalidate">
     </c:if>
              <c:if test="${tag || aab101 == rows[1].aab101 }">
	       <input type="button" id="del" name="next" value="ɾ��" 
	              onclick="onDel('${param.aab501}')" 
	              formnovalidate="formnovalidate" >
              </c:if>
               <input type="submit" onclick="back()" name="next" value="����" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
              	<input type="button" onclick="onBack()" id="backFloor" value="��һҳ">
					<input type="button" onclick="onNext()" id="nextFloor" value="��һҳ">
					<input hidden="true" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
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
    	  if(${rows[0].collection})
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
    	  if(${rows[0].like})
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
</html>