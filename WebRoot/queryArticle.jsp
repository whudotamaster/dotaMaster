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
${msg }
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<br>
<%=session.getId() %>
<br>
<form id="myform" action="<%=path%>/queryArticle.html" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
	              ����
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>������</td>
	    <td>
	      <e:text name="qaab802"/>
	    </td>
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>���±���</td>
	    <td>�û�</td>
	    <td>����ʱ��</td>
	    <td></td>
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
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aab801 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td>
				      <!-- #  ��ê -->
				      <a href="#" onclick="onEdit('${ins.aab801}')">${ins.aab802 }</a>
				    </td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aab805 }</td>
				    <td>
				      <a href="#" onclick="onDel('${ins.aab801}')">ɾ��</a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
			          <tr>
			            <td></td>
			            <td></td>
			            <td></td>
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
	       <input type="submit" name="next" value="��ѯ">
	       <input type="submit" name="next" value="���" 
	              formaction="<%=path%>/addArticle.jsp">
	       <input type="submit" id="del" name="next" value="ɾ��" 
	              formaction="<%=path%>/delArticle.html"  disabled="disabled">
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
      
      function onEdit(vaab801)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdArticle.html?aab801="+vaab801;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab801)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdArticle.html?aab801="+vaab801;
    	 alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</html>