<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
 #a tr {
	height: 80px;
}

#a td {
style=text-align:left;
vertical-align:middle;
}

#b td {
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

                background: url(images/timg.png);

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
	${msg }
<%@ include file="header.jsp" %>
	<br>
	<br>
	<form id="myform" action="<%=path%>/forum.html" method="post">
		<!-- 查询条件区 -->
		<table id="b" align="center" class="table table-striped" style="background-color:#85a3bc;opacity: 0.9;width:90%">
			<tr>
				<td colspan="4">查询条件</td>
			</tr>
			<tr>
				<td>查询內容</td>
				<td colspan="2"><e:text name="aab502" />
				<input type="button" class="btn btn-secondary  active" onclick="onQuery()" name="next" value="查询">
				</td>
			</tr>
			<tr>
				<td>区块</td>
				<td><e:radio name="aab506" value="普通区:0,精华区:1" defval="0" onclick="onQuery()" /></td>
				<td>
					<c:choose>
				<c:when test="<%= aab101!=null %>">
					<input type="submit" class="btn btn-secondary  active"
					id="addPost" name="next" value="发帖" formaction="<%=path%>/addPostOnLoad.html">
				</c:when>
				<c:otherwise>
						<input type="submit" class="btn btn-secondary  active"
					id="addPost" name="next" value="发帖" formaction="<%=path%>/login.html">
				</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
		<!-- 数据迭代区 -->
		<table align="center" class="table table-striped" id="a" style="background-color:#85a3bc;opacity: 0.9;width:90%">
			<tr>
				<c:if test="${tag}">
				<td></td>
				</c:if>
				<td style="width:50%;text-align:left;vertical-align:middle">帖标题</td>
				<td style="text-align:left;vertical-align:middle">发帖人</td>
				<td style="text-align:left;vertical-align:middle">回复数</td>
				<td style="text-align:left;vertical-align:middle">时间</td>	
				<c:if test="${tag}">
				<td>
				</td>
				</c:if>	
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
						<c:if test="${tag}">
						<td>
							<input type="checkbox" name="idlist"
								value="${ins.aab501 }" onclick="onSelect(this.checked)">
						
							</td>
								</c:if>
							<td style="width:40%">
							<!-- #  空锚 --> 
							<div class="posthidden" style="width:80%">
							<c:if test="${(rows[0].aab107)/100 >= ins.aab507 || ins.aab101 == aab101}">
							<a href="#" onclick="onVisit('${ins.aab501 }','${ins.aab507 }')" style="color:#000000;text-decoration:underline">${ins.aab502 }</a>
							</c:if>
							<c:if test="${(rows[0].aab107)/100 < ins.aab507 && ins.aab101 != aab101 }">
							<a href="#" onclick="alert('该帖要${ins.aab507}級或以上才能观看该帖子');" style="color:#FF2222;text-decoration:underline ">------该帖要${ins.aab507}級或以上才能观看该帖子------</a>
							</c:if>
							</div>
							</td>
							<td style="width:10%">
								<!-- #  用户名及头像--> 
								<div class="posthidden" style="width:50%">
								<a style="color:#000000;text-decoration:underline" href="#" onclick="onCheck('${ins.aab101}')">${ins.aab102 }</a>
								<img src=<%=path%>/images/${ins.aab105 } class="round_icon"
								onclick="onEdit('${ins.aab101}')">
								</div>
							</td>
							<td >${ins.aab505 }</td>
							<td >${ins.aab504 }</td>
							<c:if test="${tag}">
							<td>
							<a style="color:#000000;text-decoration:underline" href="#" onclick="onDel('${ins.aab501}')">删除</a>
							</td>
							</c:if>	
						</tr>
					</c:forEach>
					<!-- 补充空行 -->
					<c:forEach begin="${fn:length(rows)+1 }" step="1" end="11">
						<tr>
							<c:if test="${tag }">
							<td></td>
							</c:if>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<c:if test="${tag }">
							<td>
							</td>
							</c:if>	
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="1" step="1" end="11">
						<tr>
							<c:if test="${tag}">
							<td></td>
							</c:if>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<c:if test="${tag }">
							<td>
							</td>
							</c:if>	
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<!-- 功能按钮区 -->
		<table width="95%" align="center">
			<tr>
				<td align="center">
					<c:if test="${tag }">
					<input type="submit" class="btn btn-secondary  active"
					id="goodPost" name="next" value="加精" formaction="<%=path%>/goodPost.html"
					disabled="disabled">
					<input type="submit" class="btn btn-secondary  active"
					id="delPost" name="next" value="删除" formaction="<%=path%>/delPost.html"
					disabled="disabled">
					</c:if>
					<c:if test="${ aab101 !=null }">
					<input type="submit" class="btn btn-secondary  active"
					id="collectionPase" name="next" onclick="back()" value="收藏页面" 
					formaction="<%=path%>/queryCollection.html">
					<input type="submit" class="btn btn-secondary  active"
					id="historyPase" name="next" onclick="back()" value="历史发帖 "
					formaction="<%=path%>/queryHistoryById.html">
					</c:if>
					<input type="button" class="btn btn-secondary  active" onclick="onBack()" id="backFloor" value="上一页">
					<input type="button" class="btn btn-secondary  active" onclick="onNext()" id="nextFloor" value="下一页">
					<input hidden="true" class="btn btn-secondary  active" type="text" name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
					</td>
			</tr>
		</table>
		 <e:hidden name="aab101" defval="<%=aab101 %>"/>
	</form>
<%@include file="footer.jsp" %>
</body>
	<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("goodPost");
    	  var vde2=document.getElementById("delPost");
    	  vdel.disabled=(count==0);
    	  vde2.disabled=(count==0);
      }
      
      function onVisit(vaab501,vaab507)
      {
    	 if(${aab107/100 >= vaab507+0}){
    		 document.getElementById("nowFloor").value = 1;
    		 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/post.html?aab501="+ vaab501;
        	 //alert(vform.action);
        	 vform.submit();
    	 }
      }
     function onCheck(qaab101)
      {
    	  var vform = document.getElementById("myform");
     	 vform.action="<%=path%>/queryOtherPerson.htm?qaab101="+ qaab101;
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
      
   </script>
</html>