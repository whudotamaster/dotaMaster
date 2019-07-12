<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
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
</style>

</head>
<body>
${msg }
<br>
<br>
<form action="<%=path%>/addEmp.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
       发帖
       ${empty param.aab101 }
      <hr width="160">
    </caption>
   <c:choose>
   <c:when test="${!empty param.aab101 }">
      <tr>
	     <td>标题</td>
	     <td>
	       <e:text name="apaab502"  required="true" defval=""/> 
	     </td>
	   </tr>
	   <tr>
     <td>內容</td>
     <td>
    <!--     <e:textarea rows="5" cols="45" name="apaab503" required="true" defval=""/>
       -->
      <div id="editor"></div>
   
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
       <input type="submit" name="next" value="${empty param.aab101?'登录':'发帖' }"
              formaction="<%=path%>/${empty param.aab101?'login':'addPost' }.html?aab101=${param.aab101 }">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/forum.html?aab101=${param.aab101 }"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
 <input type="text" name="apaab503" id="apaab503" hidden="true">
</form>

</body>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        var $text1 = $('#apaab503')
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            $text1.val(html)
        }
        
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
        editor.create()
        // 初始化 textarea 的值
        $text1.val(editor.txt.html())
    </script>
</html>