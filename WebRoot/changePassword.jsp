<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>�޸ĸ�����Ϣ</title>
<link rel="shortcut icon" href="ico/favicon.ico" />
<style>
            
            .k{
            color:#FFFFFF;
            background-color:rgba(0,0,0,0.5);
           }


</style>
</head>
<body onload="imgOnLoad('DrowRanger','jpg');pageOnLoad()">
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
  <div class="container k" >
 
      <div class="py-5 text-center">
        <img id="avatar" src="/Avatar/${pic }" class="pico" style="height:200px;width:200px;border-radius:50%" >
        <h2>${aab102 }</h2>
      </div>

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4" style="color:#000;">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">���Ԥ������</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���1</h6>
                <small class="text-muted">��������1</small>
              </div>
              <span class="text-muted">�۸�1</span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���2</h6>
                <small class="text-muted">��������2</small>
              </div>
              <span class="text-muted">�۸�2</span>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���3</h6>
                <small class="text-muted">��������3</small>
              </div>
              <span class="text-muted">�۸�3</span>
            </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���4</h6>
                <small class="text-muted">��������4</small>
              </div>
              <span class="text-muted">�۸�4</span>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">���5</h6>
                <small class="text-muted">��������5</small>
              </div>
              <span class="text-muted">�۸�5</span>
            </li>
          </ul>
         </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">�޸�����</h4>
		<form  method="post" action="<%=path%>/updtPsnPwd.html" name="myform" >
       	     <div class="row"> 
              <div class="col-md-6 mb-3">
                <label for="lastName">������ԭ����</label>
                <input type="password" class="form-control" style="width:200px" id="oaab104" name="oaab104" placeholder="" value="${ins.aab102 }" required>
              </div>
            </div>
            
            <hr class="mb-4"> 
           
           <div class="row"> 
           <div class="col-md-6 mb-3">
                <label for="lastName">������������</label>
                <input type="password" class="form-control" style="width:200px" 
                id="naab104" name="naab104" placeholder="" value="${ins.aab102 }" required>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">��ȷ��������</label>
                <input type="password" class="form-control" style="width:200px" 
                id="maab104" name="maab104" placeholder="" value="${ins.aab102 }" required>
              </div>
            </div>
         
             <hr class="mb-4"> 
                    <div class="row"> 
                <div class="col-md-6 mb-3">
            		 <button class=" btn btn-primary btn-lg btn-block "  style="width:200px;" onclick="onCompare()" >ȷ���޸�</button>
                </div> 
                <div class="col-md-6 mb-3">
            		 <button class=" btn btn-primary btn-lg btn-block "  style="width:200px;" type="submit"  
            		 formaction="<%=path%>/updtPsnInf.html"   formnovalidate="formnovalidate" >�����޸�</button>
                </div> 
                      <input  type="hidden" name="aab101" value="<%=aab101%>">
                           </div>
                       </form>
           
        </div>
      </div>
   </div>

	<%@include file="footer.jsp" %>
	<!-- ����ҳ�� -->
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
		 alert("ȷ������ʧ�ܣ�����������");
		 }
}


</script>
</html>