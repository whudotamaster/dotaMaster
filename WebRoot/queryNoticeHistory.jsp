<<<<<<< HEAD
<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>ȫ����Ϣ</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
</head>
<body>
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<br>
<br>
<form id="myform" action="<%=path%>/queryNoticeHistory.html" method="post">
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>���</td>
	    <td>��Ϣ����</td>
	    <td>����ʱ��</td>
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
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="10">
	    	   	  <tr>
	    	   	    <td>${vs.count }</td>
				    <td>${ins.aad602 }</td>
				    <td>${ins.aad603 }</td>
				   </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="10">
			          <tr>
			            <td></td>
			            <td></td>
			            <td></td>
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="10">
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
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="ˢ��" formaction="<%=path%>/queryNoticeHistory.html">
	        <input type="submit" id="del" name="next" value="������ҳ"
	              formaction="<%=path%>/mainPage.jsp">
	        	<input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="��һҳ">
					<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
		<input type="hidden" name="aab101" value="<%=aab101%>">
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
=======
<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>ȫ����Ϣ</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
</head>
<body>
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<br>
<br>
<form id="myform" action="<%=path%>/queryNoticeHistory.html" method="post">
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td>���</td>
	    <td>��Ϣ����</td>
	    <td>����ʱ��</td>
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
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="10">
	    	   	  <tr>
	    	   	    <td>${vs.count }</td>
				    <td>${ins.aad602 }</td>
				    <td>${ins.aad603 }</td>
				   </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="10">
			          <tr>
			            <td></td>
			            <td></td>
			            <td></td>
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="10">
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
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="ˢ��" formaction="<%=path%>/queryNoticeHistory.html">
	        <input type="submit" id="del" name="next" value="������ҳ"
	              formaction="<%=path%>/mainPage.jsp">
	        	<input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="��һҳ">
					<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
		<input type="hidden" name="aab101" value="<%=aab101%>">
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
>>>>>>> branch 'dev' of git@github.com:whudotamaster/dotaMaster.git
</html>