<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
  
         .addPost{

                position:fixed;

                top: 0;

                left: 0;

                width:100%;

                height:100%;

                min-width: 1000px;

                z-index:-10;

                zoom: 1;

                background-color: #fff;

                background: url(images/addPost.png);

                background-repeat: no-repeat;

                background-size: cover;

                -webkit-background-size: cover;

                -o-background-size: cover;

                background-position: center 0;

            }
</style>

</head>
<body>
<div class="addPost"></div>
<%@ include file="header.jsp" %>
${msg }
<br>
<br>
<form action="<%=path%>/addEmp.html" method="post">
<table  border="1" align="center" class="table table-striped" style="background-color:#a3a9a6;opacity: 0.95;width:55%">
   <c:choose>
   <c:when test="<%=aab101!=null %>">
      <tr>
	     <td width="100px">标题</td>
	     <td>
	       <e:text name="apaab502"  required="true" defval=""/> 
	     </td>
	   </tr>
	    <tr>
	     <td width="100px">观看权限</td>
	     <td>
	       <e:select name="apaab507" value="不限:0,1级会员:1,2级会员:2,3级会员:3,4级会员:4,5级会员:5,管理員:9" defval="0" />
	     </td>
	   </tr>
	   <tr>
     <td width="100px">內容</td>
     <td>
    <!--     <e:textarea rows="5" cols="45" name="apaab503" required="true" defval=""/>
       -->
      <div id="editor" style="width:100%;background-color:#ffffff"></div>
   
     </td>
   </tr>
   </c:when>
<c:otherwise>
<tr>
<td>
	你没有登录不能发帖
	</td>
	</tr>
</c:otherwise>
</c:choose>
   <tr>
     <td colspan="2" align="center">
     	  <c:choose>
  			 <c:when test="<%=aab101!=null %>">
  			  <input type="submit" name="next" value="发帖 "
              formaction="<%=path%>/addPost.html">
     </c:when>
     <c:otherwise>
       <input type="submit" name="next" value="登录 "
              formaction="<%=path%>/login.html">
     </c:otherwise>
     </c:choose>
      <input type="submit" name="next" value="返回"
              formaction="<%=path%>/forum.html"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
 <input type="text" name="apaab503" id="apaab503" hidden="true">
 <e:hidden name="aab101" defval="<%=aab101 %>"/>
</form>
<%@ include file="footer.jsp" %>
</body>
    <script src="jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        var $text1 = $('#apaab503')
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html)
        }
        if(${ins.aab107 > 200}){
        
       
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
    </script>
</html>