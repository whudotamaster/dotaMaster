<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>${rows[1].aab101}的帖子${rows[1].aab502 }</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <style type="text/css">
     tr
     {
        height:25px;
     }
     .round_icon {
	width: 75px;
	height: 75px;
	display: flex;
	border-radius: 50%;
	align-items: center;
	justify-content: center;
	vertical-align:middle;
	overflow: hidden;
	margin-left: 10px;
}

            .posthidden{
white-space:nowrap;
overflow:hidden; 
text-overflow:ellipsis;
color:#000000;
text-align:left;
vertical-align:middle;
}

  body
  {
  color:black;
  }
   </style>
   
</head>
<body onload="imgOnLoad('timg','png');pageOnLoad()">
<%@ include file="header.jsp" %>
<br>
${msg }
<br>
<form id="myform" action="<%=path%>/addComment.html?aab501=${param.aab501 }" method="post">
  <!-- 查询条件区 -->
	<!-- 数据迭代区 -->
	<table border="1" align="center" class="table table-striped" style="background-color:#85a3bc;opacity: 0.9;width:900px">
	  <tr>
	    <td colspan="4">
	    <h4>${rows[1].aab502 }</h4>
	    </td>
	  </tr>
	  <!--
	         注意事项
	    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
	    2.所有的属性之间至少要有一个空格,否则报错
	    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
	   -->
	         <!-- 显示实际查询到的数据 -->
	    	   	  <tr>
				    <td style="width:120px">
				    <div class="posthidden" style="width:95%">
					<!-- #  用户名及头像--> 
								<a style="color:#000000;text-decoration:underline" href="#" onclick="onEdit('${rows[1].aab101}')">${rows[1].aab102 }</a>
								<img src="/Avatar/${rows[1].aab105 }" class="round_icon"
								onclick="onEdit('${rows[1].aab101}')">
								</div>
				    </td>
				    <c:if test="${(rows[0].aab107)/100 >= rows[1].aab507+0 || rows[1].aab101 == aab101}">
				    <td><div style="min-height: 80px">${rows[1].aab503 }</div>
				     <div style="text-align:right;vertical-align:bottom;">
				     <c:choose>
				   	<c:when test="<%=aab101!=null %>">
				   	 <font size="2">点赞${rows[0].countlike }数</font>
				 	   <input type="button"  class="btn btn-secondary  active" value="点赞" 
				       	   onclick="like('${param.aab501 }')"
				           formnovalidate="formnovalidate" >
				       <input type="button"  class="btn btn-secondary  active" value="打赏" 
				       onclick="reward('${param.aab501 }','${rows[1].aab101}')"
				            formnovalidate="formnovalidate" >
				 	   <input type="button"  class="btn btn-secondary  active" value="收藏" 
				 	       onclick="collecttion('${param.aab501 }')"
				 	       formnovalidate="formnovalidate"> 
				    </c:when>
				    <c:otherwise>
				      <font size="2">点赞${rows[0].countlike }数</font>
				 	   <input type="submit"  class="btn btn-secondary  active" value="点赞" formaction="<%=path%>/login.html"
				           formnovalidate="formnovalidate" >
				      <input type="submit"  class="btn btn-secondary  active" value="打赏" formaction="<%=path%>/login.html"
				          formnovalidate="formnovalidate">
				 	   <input type="submit"  class="btn btn-secondary  active" value="收藏" formaction="<%=path%>/login.html"
				 	       formnovalidate="formnovalidate"> 
				    </c:otherwise>
					</c:choose>
					<font size="2">1楼  ${rows[1].aab504 }</font>
					</div>
				    </td>
				    </c:if>
				    <c:if test="${(rows[0].aab107)/100 < rows[1].aab507+0 && rows[1].aab101 != aab101}">
				     <td><a style="color:#FF2222 ">------该帖要${rows[1].aab507}級或以上才能观看该帖子------</a></td>
				     <td><a style="color:#FF2222 ">------该帖要${rows[1].aab507}級或以上才能观看该帖子------</a></td>
				    </c:if>
				  </tr>
				  <c:if test="${(rows[0].aab107)/100 >= rows[1].aab507+0 || rows[1].aab101 == aab101}">
		      <!-- 补充空行 -->
		    <c:forEach items="${rows }" var="ins" varStatus="vs" begin="2" end="11">
			          <tr>
			            	 <td style="width:80px">
				 			   <div class="posthidden" style="width:95%">
								 <a style="color:#000000;text-decoration:underline" href="#" onclick="onEdit('${ins.aab101}')">${ins.aab102 }</a>
								<img src="/Avatar/${ins.aab105}" class="round_icon"
								onclick="onEdit('${ins.aab101}')">
								</div>
							</td>
							
			            <td><div style="min-height: 80px">${ins.aab603 } </div>
			            <div style="text-align:right;vertical-align:middle;">
			           <font size="2"> ${ins.aab602+1 }楼  ${ins.aab604 }</font>
			        	 </div>
			        	 </td>
			          </tr>
		      </c:forEach>
		      </c:if>
	   <c:if test="${(rows[0].aab107)/100 >=  rows[1].aab507+0 || rows[1].aab101 == aab101}">
	     <tr>
     <td colspan="2">
		<div id="editor" style="width:100%;height:200px;text-align:left;vertical-align:middle;background-color: #ffffff;opacity:1;"></div>
     </td>
   </tr>
   </c:if>
	</table>
	
	<!-- 功能按钮区 -->
	<table width="95%" align="center">
	  <tr>
	    <td align="center">
  			 <c:if test="${aab101 != null && (rows[0].aab107)/100 >= rows[1].aab507+0 || rows[1].aab101 == aab101}">
  			  <input type="submit"  class="btn btn-secondary  active" name="next" value="回复 ">
     </c:if>
     <c:if test="${aab101 == null}">
       <input type="submit"  class="btn btn-secondary  active" name="next" value="登录 "
              formaction="<%=path%>/login.html"
               formnovalidate="formnovalidate">
     </c:if>
              <c:if test="${tag || aab101 == rows[1].aab101 }">
	       <input type="button" id="del"  class="btn btn-secondary  active" name="next" value="删除" 
	              onclick="onDel('${param.aab501}')" 
	              formnovalidate="formnovalidate" >
              </c:if>
               <input type="submit" onclick="back()"  class="btn btn-secondary  active" name="next" value="返回" 
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
              	<input type="button" onclick="postPage('${param.aab501 }');onBack()"  class="btn btn-secondary  active" id="backFloor" value="上一页">
					<input type="button" onclick="postPage('${param.aab501 }');onNext()"  class="btn btn-secondary  active" id="nextFloor" value="下一页">
					<input hidden="true" type="text"  name="nowFloor" id="nowFloor" value="${rows[0].nowFloor }">
					<e:hidden name="floor" defval="${rows[0].floor }"/>
	    </td>
	  </tr>
	</table>
	 <input type="text" name="acaab603" id="acaab603" hidden="true">
  <e:hidden name="aab101" defval="${aab101 }"/>
</form>
<%@ include file="footer.jsp" %>
</body>

   <script src="jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        var $text1 = $('#acaab603')
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html)
        }
        if(${rows[0].aab107 > 200}){
        editor.customConfig.menus = [
    'head',  // 标题
    'bold',  // 粗体
    'fontSize',  // 字号
    'fontName',  // 字体
    'italic',  // 斜体
    'underline',  // 下划线
    'strikeThrough',  // 删除线
    'foreColor',  // 文字颜色
    'backColor',  // 背景颜色
    'list',  // 列表
    'justify',  // 对齐方式
];
        }
        else
        	{
        	  editor.customConfig.menus = [
        		    'bold',  // 粗体
        		    'fontSize',  // 字号
        		    'foreColor',  // 文字颜色
        		];
        	}
        editor.create()
        // 初始化 textarea 的值
        $text1.val(editor.txt.html())

    function collecttion(vaab501,collection)
      {
    	  var vform = document.getElementById("myform");
    	  if(${rows[0].collection})
    	  {
    		  vform.action="<%=path%>/delCollectionById.html?aab501="+vaab501;
    		  alert("刪除收藏");
    	  }
    	  else
    	  {
    		  vform.action="<%=path%>/addCollectionById.html?aab501="+vaab501;
    		  alert("增加收藏");
    	  }
    	  vform.submit();
      }
      
      function reward(vaab501,paab101)
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
      
      function postPage(aab501) 
      {
    	  var vform = document.getElementById("myform");
    	  vform.action="<%=path%>/post.html?aab501="+aab501;
		}
   </script>
   <style>
   .w-e-text-container{
height:173px; 
max-height:173px; 
}

.w-e-text{
height:173px; 
max-height:173px; 
}
   </style>
</html>