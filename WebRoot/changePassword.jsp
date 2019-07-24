<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>修改个人信息</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
<style>
            
            .k{
            color:#FFFFFF;
            background-color:rgba(0,0,0,0.5);
           }


</style>
</head>
<body onload="imgOnLoad('DrowRanger','jpg');pageOnLoad()">
<!-- 引入头部导航栏 -->
<%@ include file="header.jsp" %>
  <div class="container k" >
 
      <div class="py-5 text-center">
        <img id="avatar" src="/Avatar/${pic }" class="pico" style="height:200px;width:200px;border-radius:50%" >
        <h2>${aab102 }</h2>
      </div>

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4" style="color:#000;">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">广告预留界面</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告1</h6>
                <small class="text-muted">宣传标语1</small>
              </div>
              <span class="text-muted">价格1</span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告2</h6>
                <small class="text-muted">宣传标语2</small>
              </div>
              <span class="text-muted">价格2</span>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告3</h6>
                <small class="text-muted">宣传标语3</small>
              </div>
              <span class="text-muted">价格3</span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告4</h6>
                <small class="text-muted">宣传标语4</small>
              </div>
              <span class="text-muted">价格4</span>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">广告5</h6>
                <small class="text-muted">宣传标语5</small>
              </div>
              <span class="text-muted">价格5</span>
            </li>
          </ul>
         </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">修改密码</h4>
		<form  method="post" action="<%=path%>/updtPsnPwd.html" name="myform" >
       	     <div class="row"> 
              <div class="col-md-6 mb-3">
                <label for="lastName">请输入原密码</label>
                <input type="password" class="form-control" style="width:200px" id="oaab104" name="oaab104" placeholder="" value="${ins.aab102 }" required>
              </div>
            </div>
            
            <hr class="mb-4"> 
           
           <div class="row"> 
           <div class="col-md-6 mb-3">
                <label for="lastName">请输入新密码</label>
                <input type="password" class="form-control" style="width:200px" 
                id="naab104" name="naab104" placeholder="" value="${ins.aab102 }" required>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">请确认新密码</label>
                <input type="password" class="form-control" style="width:200px" 
                id="maab104" name="maab104" placeholder="" value="${ins.aab102 }" required>
              </div>
            </div>
         
             <hr class="mb-4"> 
                    <div class="row"> 
                <div class="col-md-6 mb-3">
            		 <button class=" btn btn-primary btn-lg btn-block "  style="width:200px;" onclick="onCompare()" >确认修改</button>
                </div> 
                <div class="col-md-6 mb-3">
            		 <button class=" btn btn-primary btn-lg btn-block "  style="width:200px;" type="submit"  
            		 formaction="<%=path%>/updtPsnInf.html"   formnovalidate="formnovalidate" >放弃修改</button>
                </div> 
                      <input  type="hidden" name="aab101" value="<%=aab101%>">
                           </div>
                       </form>
           
        </div>
      </div>
   </div>

	<%@include file="footer.jsp" %>
	<!-- 引入页脚 -->
</body>
<script type="text/javascript">
function onCompare()
{
	 var vform = document.getElementById("myform");
	 var o = document.getElementById("oaab104").value; 
	 var m = document.getElementById("maab104").value;
	 var n = document.getElementById("naab104").value;
	 if(m==n&&m!=null)
		 {
		 vform.action="<%=path%>/updtPsnPwd.html";
    	 vform.submit();
		 }
	 else
		 {
		 alert("确认密码失败！请重新输入");
		 }
}


</script>
</html>