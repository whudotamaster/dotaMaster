<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>竞猜列表</title>
   <link rel="shortcut icon" href="ico/favicon.ico" />
   
   <%@ include file="header.jsp" %>
   <style type="text/css">
   body
  {
  color:black;
  }
            
  *{
      margin: 0;
      padding: 0;
    }

    .container{
      width: 100%;
    }
    .list-item{
      width: 700px;
      height:400px;
      margin: 20px auto;
      border: 2px #D3D3D3  solid;
      box-sizing: border-box;
      padding: 5px 0 20px;
      background-color:white;
      opacity: 0.95;
      
    }
    .list-item:hover{
      border-image: linear-gradient(45deg,aqua,blue) 2 2 2 2;

    }
    .header{
      text-align: center;
    }
    .flex-container{
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: space-around;
      height: 250px;
    }
    .body{
      display: flex;
      flex-direction: row;
      justify-content: center;
      height:500px;
    }
    .left{
      flex: 1;
    }
    .mid{
      width: 200px;
    }
    .right{
      flex: 1;
    }
    .item-img{
      width: 70px;
      height: 70px;
    }
    .my-input{
      width: 50px;
    }
    .bet-btn{
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background: red;
      color: white;
      font-size: 15px;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
      outline: none;
      border: none;
    }
    .vs{
      font-size: 50px;
    }

    
            
    </style>
            

   
   <script type="text/javascript">    
      function onBet(vaad101,count)
      {
    	 var name="myform"+count;
    	 var vform = document.getElementById(name);
    	 vform.action="<%=path%>/playBet.html?aad101="+vaad101+"&count="+count;
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
<body onload="imgOnLoad('bg','png');pageOnLoad()">


${msg }

<br>
<br>
<div class="demo"></div>
<div class="container">
  <c:forEach items="${rows }" var="ins" varStatus="vs">
   <form id="myform${vs.count }" class="flex-container list-item" >
      <div class="header"></div>
      <div class="body">
        <div class="left flex-container">
            <img src="<%=path%>/images/${ins.图片 }" alt="${ins.aac1103 }" class="item-img">
            <p>${ins.aac1103 }</p>
            <p>下注量：${ins.aad102 }</p>
            <div>我要下注：<input type="text" name="aad202${vs.count }" class="my-input" value="0"></div>
        </div>
        <div class="mid flex-container">
          <p class="vs">VS</p>
          <p> ${ins.aac1102 }</p>
          <p><input type="button" class="bet-btn" value="下注" onclick="onBet('${ins.aad101}','${vs.count }')"></p>
        </div>
        <div class="right flex-container">     
            <img src="http://01.imgmini.eastday.com/mobile/20180413/20180413210854_5981ee25d426a7282b09ae4f344f9adc_2.jpeg" alt="VG" class="item-img">
            <p>${ins.aac1104 }</p>
            <p>下注量：${ins.aad103 }</p>
            <div>我要下注：<input type="text" class="my-input" name="aad203${vs.count }" value="0"></div>
        </div>
      </div>
   
    <input type="hidden" name="count" value="${vs.count }">
    <input type="hidden" name="aad101" value="${ins.aad101 }">
    <input type="hidden" name="aab101" value="<%=aab101 %>">
    </form>
  </c:forEach>    
</div>

	
<form id="myform" action="<%=path%>/queryBet.html" method="post" >	
	<!-- 功能按钮区 -->
	<table width=100% align="center" >
	  <tr>
	    <td align="center">
	   <c:if test="${!empty aab101}">
	       <input type="submit" class="btn btn-secondary  active" onclick="back()" name="next" value="查询">
	       <input type="submit" class="btn btn-secondary  active" onclick="back()" name="next" value="查看历史押注" 
	              formaction="<%=path%>/queryUserBet.html">
	   </c:if>           
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aab101" value="<%=aab101 %>">
</form>
</body>
<script type="text/javascript">
function betPage() {
	  var vform = document.getElementById("myform");
	  vform.action="<%=path%>/queryBet.html";
	
}
</script>
<%@include file="footer.jsp" %>
</html>