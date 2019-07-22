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
        height:50px;
     }
   </style>
</head>
<body>
<%@ include file="header.jsp" %>
${msg }
<div class="demo" style="opacity: 0.9"></div>
<br>
<br>
<div class="container">
  <div class="row">
    <div class="col-sm">
      One of three columns
    </div>
    <div class="col-sm">
      One of three columns
    </div>
    <div class="col-sm">
      One of three columns
    </div>
  </div>
</div>
<form id="myform" action="<%=path%>/queryHero.html" method="post">
  <!-- ��ѯ������ -->
	<table align="center" class="table table-striped" style="background-color:#D1DDF4;opacity: 0.9;width:85%">
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>Ӣ����</td>
	    <td>
	      <e:text name="qaac102"/>
	    </td>
	</table>
	<!-- ���ݵ����� -->
	<table align="center" class="table table-striped" style="background-color:#D1DDF4;opacity: 0.9;width:85%">
	  <tr>
	    <td></td>
	    <td>���</td>
	    <td>Ӣ��ͼ��</td>
	    <td>Ӣ����</td>
	    <td>�����ɳ�</td>
	    <td>���ݳɳ�</td>
	    <td>�����ɳ�</td>
	    <td>��ʼѪ��</td>
	    <td>��ʼ����</td>
	    <td>����</td>
	    <td>��ʼ����</td>
	    <td>��ʼ����</td>
	    <td>��ʼ����</td>
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
		     <c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.aac101 }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>${vs.count }</td>
				    <td >
				       <a href="#" onclick="onRead('${ins.aac101}')">
				        <img style="width:70%; height:100%" alt="no image" src=<%=path%>/images/${ins.aac112 }></a>
				     </td>
				    <td>
				      <!-- #  ��ê -->
				      <a href="#" onclick="onEdit('${ins.aac101}')">${ins.aac102 }</a>
				    </td>
				    <td>${ins.aac103 }</td>
				    <td>${ins.aac104 }</td>
				    <td>${ins.aac105 }</td>
				    <td>${ins.aac106 }</td>
				    <td>${ins.aac107 }</td>
				    <td>${ins.aac108 }</td>
				    <td>${ins.aac109 }</td>
				    <td>${ins.aac110 }</td>
				    <td>${ins.aac111 }</td>
				    <c:if test="${aab108==2}">
				    <td>
				      <a href="#" onclick="onDel('${ins.aac101}')">ɾ��</a>
				    </td>
				    </c:if>
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="11">
			          <tr>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
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
	        <c:forEach begin="1" step="1" end="11">
	           <tr>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
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
	<table  border="0" cellpadding="0" cellspacing="0"  align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="��ѯ">
	       <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="���" 
	              formaction="<%=path%>/addHero.jsp">
	       <input type="submit" id="del" name="next" class="btn btn-secondary  active" value="ɾ��" 
	              formaction="<%=path%>/delHero.html"  disabled="disabled">
	       </c:if>
	       <input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="��һҳ">
		   <input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="��һҳ">
		   <input hidden="true" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
		   <e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
</form>
<!-- ����Ų������� -->
<%@ include file="footer.jsp" %>
</body>
   <script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdHero.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onRead(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdHeroFM.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdHero.html?aac101="+vaac101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</html>