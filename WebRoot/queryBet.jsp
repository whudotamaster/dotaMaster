<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>Insert title here</title>
   <%@ include file="header.jsp" %>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
   
   <script type="text/javascript">    
      function onBet(vaad101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/playBet.html?aad101="+vaad101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      $("#totalCnt").change(function () {
          var totalCnt = $("#totalCnt").val();
          if (totalCnt != parseInt(totalCnt)){
              $.sobox.alert(
                      '温馨提示',
                      '请输入正确的正整数',
                      function () {
                          $("#totalCnt").val("");
                      }
              )
              return false;
          }
      })
      
   </script>
</head>
<body>

${msg }
<br>
<br>
<form id="myform" action="<%=path%>/queryBet.html" method="post">
	<!-- 数据迭代区 -->
	
	<table border="1" width="95%" align="center">
	 <caption>
	               可押注比赛
	    <hr width="160">
	  </caption>
	  <tr>
	    <td>序号</td>
	    <td>赛事</td>
	    <td>战队1</td>
	    <td>战队2</td>
	    <td>比赛开始时间</td>
	    <td>A方押注数量</td>
	    <td>B方押注数量</td>
	    <td>押注A方</td>
	    <td>押注B方</td>
	    <td></td>
	  </tr>
	  <!--
	         注意事项
	    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
	    2.所有的属性之间至少要有一个空格,否则报错
	    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
	   -->
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aac702 }</td>
				    <td>${ins.aac1103 }</td>
				    <td>${ins.aac1104 }</td>
				    <td>${ins.aac1102 }</td>
				    <td>${ins.aad102 }</td>
				    <td>${ins.aad103 }</td>
				    <td>
				      <input type="text" name="aad202" defval="0" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
				    </td>
				    <td>
				      <input type="text" name="aad203" defval="0" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
				    </td>
				   <td>
				      <a href="#" onclick="onBet('${ins.aad101}')">下注</a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
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
	             <td></td>
	             <td></td>
	             <td></td>
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询">
	       <input type="submit" name="next" value="查看历史押注" 
	              formaction="<%=path%>/queryUserBet.html">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aab101" value="<%=aab101 %>">
</form>
<form action="<%=path%>/buyVIP.html" method="post">
<input type="search" name="month" placeholder="输入开通的月数" align="center" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
<input type="submit" name="next" value="开通" align="center">
<input type="hidden" name="aab101" value="<%=aab101 %>">
<input type="hidden" name="aab109" value="<%=aab109 %>">
</form>
</body>
</html>