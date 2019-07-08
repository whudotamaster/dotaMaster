<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
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
      
      function onDel(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdEmp.html?aab101="+vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</head>
<body>
${msg }
${ins }
<br>
<%=session.getId() %>
<br>
<form id="myform" action="<%=path%>/queryEmp.html" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
	               ������ϸҳ��
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>����</td>
	    <td>
	      <e:text name="qaab102"/>
	    </td>
	    <td>Ա�����</td>
	    <td>
	      <e:text name="qaab103"/>
	    </td>
	  </tr>
	  <tr>
	    <td>�Ա�</td>
	    <td>
	      <e:radio name="qaab105" value="��:1,Ů:2,��ȷ��:3,���޶�:''" defval=""/>
	    </td>
	  </tr>

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
				    <td>${ins.aab503 }</td>
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
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ">
	       <input type="submit" name="next" value="���" 
	              formaction="<%=path%>/addEmp.jsp">
	       <input type="submit" id="del" name="next" value="ɾ��" 
	              formaction="<%=path%>/delEmp.html"  disabled="disabled">
	    </td>
	  </tr>
	</table>
	<e:hidden name="aab101" />
</form>
</body>
</html>