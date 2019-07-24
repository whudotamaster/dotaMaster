<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>�޸��ҵ���Ϣ</title>
   <script src="jquery-3.4.1.min.js"></script>
   <link rel="shortcut icon" href="ico/favicon.ico" />
  <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">
    <style type="text/css">
    
    .background{
                position:fixed;
                top: 0;
                left: 0;
                width:100%;
                height:100%;
                min-width: 1000px;
                z-index:-10;
                zoom: 1;
                background: url(images/backgrounds/DrowRanger.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                -webkit-background-size: cover;
                -o-background-size: cover;
                background-position: center 0;
            }
            
            .k{
            color:#FFFFFF;
            background-color:rgba(0,0,0,0.5);
           }
    
    </style>
</head>
<body >
<!-- ����ͷ�������� -->
<%@ include file="header.jsp" %>
<div class="background"></div>
	<c:if test="${aab101==ins.aab101}">
	  <div class="container k" >
 
      <div class="py-5 text-center">
        <img id="avatar" src="/Avatar/${ins.aab105 }" class="pico" style="height:200px;width:200px;border-radius:50%" >
        <h2>${ins.aab102 }</h2>
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
          <h4 class="mb-3">�޸ĸ�����Ϣ</h4>
            <div class="row">
	              <div class="col-md-6 mb-3">
		                <label for="firstName">�ҵ��˺�</label>
		                 <a><br>${ins.aab103}</a>
	              </div>
	              <form id="form1" action="<%=path%>/uploadUser.htm" method="post" enctype="multipart/form-data">
		             	 <div class="col-md-6 mb-3"  style="display: none;">
		             		<input class=" btn btn-primary btn-lg btn-block " type="file" style="width:200px"name="file" id="file" />
		                 </div>
		                 <div class="col-md-6 mb-3">
		                 	<input class=" btn btn-primary btn-lg btn-block " type="submit" style="width:200px" name="next" id="tofile" value="�޸�ͷ��"/ >
						 </div>
		              	 <input  type="hidden" name="aab101" value="<%=aab101%>">
	               </form>
       	    </div>
       	    <hr class="mb-4">
         <form method="post" action="<%=path%>/updtPsnInf.html" >
       	     <div class="row"> 
              <div class="col-md-6 mb-3">
                <label for="lastName">���������ǳ�</label>
                <input type="text" class="form-control" style="width:200px" id="aab102" name="aab102" placeholder="" value="${ins.aab102 }" required>
              </div>
            
              
                <div class="col-md-6 mb-3">
            		 <button class=" btn btn-primary btn-lg btn-block "  style="width:200px;position:absolute;top:25px;" type="submit" >�޸��ǳ�</button>
                </div> 
                 </div>
                      <input  type="hidden" name="aab101" value="<%=aab101%>">
                       </form>
                  <hr class="mb-4">
            
      	 <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">��ǰ����ֵ��</label>
                 <a><br>${ins.aab107 }</a>
              </div>
               <div class="col-md-6 mb-3">
                <label for="firstName">��ǰ�ȼ���</label>
                <br>
               <fmt:formatNumber value="${(ins.aab107-ins.aab107%100)/100 }" pattern="#" type="number"/>
              </div>
          </div>
         	  <hr class="mb-4">
              <div class="row">
	              <div class="col-md-6 mb-3">
	                <label for="firstName">M����</label>
	                 <a><br>${ins.aab106 }</a>
	              </div>
	               <div class="col-md-6 mb-3">
	                <label for="firstName">VIP����ʱ�䣺</label>
	                
	               <a><br>${ins.aab109 }</a>
	              </div>
              </div>
              <hr class="mb-4">  
              <div class="row">
              	 <div class="col-md-6 mb-3">
             	    <form method="post">
                		 <button class=" btn btn-primary btn-lg btn-block " type="submit" style="width:200px" formaction="<%=path%>/changePassword.jsp" >�޸�����</button>
					</form>
                 </div>
              </div>
        </div>
      </div>
   </div>
   
   </c:if>
   
	<%@include file="footer.jsp" %>
	<!-- ����ҳ�� -->
</body>
    <script>
    window.onload = function () {
        document.querySelector("#file").onchange = function () {
            var req = new XMLHttpRequest();
            var form = new FormData(document.getElementById("form1"));
//          form.append("file",document.querySelector("#file").files[0]);
            req.open("post", "${pageContext.request.contextPath}/upload", true);
            req.send(form);
            req.onload = function () {
                document.getElementById("img").src = "${pageContext.request.contextPath}/pic/" + req.responseText;
            }
        }
    }
        $(document).ready(function(){
 	   $('#avatar').click(function(){
        $('#file').click();
    });
 	    
});
      
    
    </script>
    
<script type="text/javascript" src="jquery-1.7.2.js"></script> /
<script type="text/javascript">
$(document).ready(function(){
	if(${msg=="�޸�����ɹ�"})
	{
	alert("�޸�����ɹ�");
	}
	if(${msg=="	�޸�����ʧ��"})
	{
	alert("�޸�����ʧ��");
	}

	
})
</script>

</html>