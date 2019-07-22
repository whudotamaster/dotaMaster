<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
tr {
	height: 40px;
}

#a td {
style=text-align:left;
vertical-align:middle;
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

 body
  {
  color:black;
  }
       .demoTimg{

                position:fixed;

                top: 0;

                left: 0;

                width:100%;

                height:100%;

                min-width: 1000px;

                z-index:-10;

                zoom: 1;

                background-color: #fff;

                background: url(images/hc.png);

                background-repeat: no-repeat;

                background-size: cover;

                -webkit-background-size: cover;

                -o-background-size: cover;

                background-position: center 0;

            }
            .posthidden{
white-space:nowrap;
overflow:hidden; 
text-overflow:ellipsis;
color:#000000;
}
</style>

</head>
<body >
<div class="demoTimg"></div>
<%@ include file="header.jsp" %>
	${msg }
	<br>
	<br>
	<form id="myform" action="<%=path%>/queryCollection.html" method="post">
		<!-- 查询条件区 -->
		
		<!-- 数据迭代区 -->
		<table align="center" class="table table-striped" id="a" style="background-color:#8eb0cc;opacity: 0.9;width:80%">
				<td></td>
				<td>帖标题</td>
				<td>发帖人</td>
				<td>收藏时间</td>
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
					<c:forEach items="${rows }" var="ins" varStatus="vs" begin="1" end="11">
						<tr>
							<td><input type="checkbox" name="idlist"
								value="${ins.aab701 }" onclick="onSelect(this.checked)">
								</td>
								<td width="50%">
							<!-- #  空锚 --> 
							<div class="posthidden" style="width:80%">
							<a href="#" onclick="onVisit('${ins.aab501 }')"  style="color:#000000;text-decoration:underline">${ins.aab502 }</a>
							</div>
							</td>
							<td width="15%">
								<!-- #  用户名及头像--> 
								<a href="#" onclick="onCheck('${ins.aab101}')"  style="color:#000000;text-decoration:underline" >${ins.aab102 }</a>
							</td>
							<td>${ins.aab702 }</td>
							<td><a href="#" onclick="onDelCollection('${ins.aab501}')"  style="color:#000000;text-decoration:underline">删除</a></td>
						</tr>
					</c:forEach>
					<!-- 补充空行 -->
					<c:forEach begin="${fn:length(rows)+1 }" step="1" end="11">
						<tr>
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
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<!-- 功能按钮区 -->
		<table width="95%" align="center">
			<tr>
				<td align="center">
				<input type="submit" class="btn btn-secondary  active"
					id="delCollection" name="next" value="删除收藏" 
					disabled="disabled"
					formaction="<%=path%>/delCollection.html">
				  <input type="submit" class="btn btn-secondary  active" name="next" onclick="back()" value="返回" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
                   	<input type="button" class="btn btn-secondary  active" onclick="collectionPage();onBack()" id="backFloor" value="上一页">
					<input type="button" class="btn btn-secondary  active" onclick="collectionPage();onNext()" id="nextFloor" value="下一页">
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
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("delCollection");
    	  vdel.disabled=(count==0);
      }
      
      function onVisit(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/post.html?aab501="+ vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDelCollection(vaab501)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delCollectionByIdInQueryCollection.html?aab501="+vaab501;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
      function onCheck(qaab101)
      {
    	  var vform = document.getElementById("myform");
     	 vform.action="<%=path%>/queryOtherPerson.htm?qaab101="+ qaab101;
     	 //alert(vform.action);
     	 vform.submit();
      }
      
      function collectionPage() 
      {
    	  var vform = document.getElementById("myform");
      	 vform.action="<%=path%>/queryHistoryById.html;
	 }
   </script>
</html>