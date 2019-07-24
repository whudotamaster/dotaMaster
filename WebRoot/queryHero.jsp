<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>��ѯӢ����Ϣ</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     .a
     {
		opacity:0.7;
		cursor: url('ico/favicon2.ico'), default;
     }
       .a:hover
        {
		opacity:1;
		
		}
		.mycontainer
		{
			width: 	100%;
			padding-left:300px;
			padding-right:300px;
			padding-top:100px;
		}
   </style>
</head>

<body onload="imgOnLoad('bg','png');pageOnLoad()">
<%@ include file="header.jsp" %>
${msg }
<br>
<br>
<form id="myform" action="<%=path%>/queryHero.html" method="post">
 <div class="mycontainer" style="z-index:2" >
      <div class="card-deck mb-3 text-center">
        <c:forEach items="${rows }" var="ins" begin="1" end="5">
	      <div class="card mb-4 box-shadow a" style="background:#000" >
	          <div class="card-header">
	            <h4 class="my-0 font-weight-normal"  style="opacity:1"><font color="white"><a href="#" onclick="onEdit('${ins.aac101}')">${ins.aac102 }</a></font></h4>
	          </div>
	          <div class="card-body">
	          	<c:if test="${aab108==2}">
      				<div>
      					<a href="#" onclick="onEditMore('${ins.aac101}')">
      						<img style="width:150px; height:150px" alt="no image" src=<%=path%>/images/${ins.aac112 }>
      					</a>
      				</div>
      			</c:if>

			    <c:if test="${aab108!=2 }">
			      	<div>
			      		<a href="#" onclick="onRead('${ins.aac101}')">
			      			<img style="width:150px; height:150px" alt="no image" src=<%=path%>/images/${ins.aac112 }>
			      		</a>
			      	</div>
			    </c:if>
	          </div>
	        </div>      
		</c:forEach>
	</div>

      <div class="card-deck mb-3 text-center">
        <c:forEach items="${rows }" var="ins" varStatus="vs" begin="6" end="10">
	      <div class="card mb-4 box-shadow a" style="background:#000" >
	          <div class="card-header">
	            <h4 class="my-0 font-weight-normal"  style="opacity:1"><font color="white"><a href="#" onclick="onEdit('${ins.aac101}')">${ins.aac102 }</a></font></h4>
	          </div>
	          <div class="card-body">
	          	<c:if test="${aab108==2}">
      				<div>
      					<a href="#" onclick="onEditMore('${ins.aac101}')">
      						<img style="width:150px; height:150px" alt="no image" src=<%=path%>/images/${ins.aac112 }>
      					</a>
      				</div>
      			</c:if>

			    <c:if test="${aab108!=2 }">
			      	<div>
			      		<a href="#" onclick="onRead('${ins.aac101}')">
			      			<img style="width:150px; height:150px" alt="no image" src=<%=path%>/images/${ins.aac112 }>
			      		</a>
			      	</div>
			    </c:if>
	          </div>
	        </div>      
		</c:forEach>
	</div>
	      <div class="card-deck mb-3 text-center">
        <c:forEach items="${rows }" var="ins" varStatus="vs" begin="11" end="15">
	      <div class="card mb-4 box-shadow a" style="background:#000" >
	          <div class="card-header">
	            <h4 class="my-0 font-weight-normal"  style="opacity:1"><font color="white"><a href="#" onclick="onEdit('${ins.aac101}')">${ins.aac102 }</a></font></h4>
	          </div>
	          <div class="card-body">
	          	<c:if test="${aab108==2}">
      				<div>
      					<a href="#" onclick="onEditMore('${ins.aac101}')">
      						<img style="width:150px; height:150px" alt="no image" src=<%=path%>/images/${ins.aac112 }>
      					</a>
      				</div>
      			</c:if>

			    <c:if test="${aab108!=2 }">
			      	<div>
			      		<a href="#" onclick="onRead('${ins.aac101}')">
			      			<img style="width:150px; height:150px" alt="no image" src=<%=path%>/images/${ins.aac112 }>
			      		</a>
			      	</div>
			    </c:if>
	          </div>
	        </div>      
		</c:forEach>
	</div>
</div>

	<!-- ���ܰ�ť�� -->
	<table  border="0" cellpadding="0" cellspacing="0"  align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="��ѯ">
	       <c:if test="${aab108==2}">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="���" 
	              formaction="<%=path%>/addHero.jsp">
	       </c:if>��
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
    	 vform.submit();
      }
      
      function onEditMore(vaac101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdHeroMore.html?aac101="+vaac101;
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