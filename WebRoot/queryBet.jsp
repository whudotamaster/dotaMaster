<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
   <title>Insert title here</title>
   <%@ include file="header.jsp" %>
   <style type="text/css">
   body
  {
  color:black;
  }
       .demo{

                position:fixed;

                top: 0;

                left: 0;

                width:100%;

                height:100%;

                min-width: 1000px;

                z-index:-10;

                zoom: 1;

                background-color: #fff;

                background: url(images/bg.png);

                background-repeat: no-repeat;

                background-size: cover;

                -webkit-background-size: cover;

                -o-background-size: cover;

                background-position: center 0;

            }
            
    </style>
            

   
   <script type="text/javascript">    
      function onBet(vaad101,count)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/playBet.html?aad101="+vaad101+"&count="+count;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      $("#totalCnt").change(function () {
          var totalCnt = $("#totalCnt").val();
          if (totalCnt != parseInt(totalCnt)){
              $.sobox.alert(
                      '��ܰ��ʾ',
                      '��������ȷ��������',
                      function () {
                          $("#totalCnt").val("");
                      }
              )
              return false;
          }
      })
      
		function show(){
		    obj = document.getElementsByName("test");
		    check_val = [];
		    for(k in obj){
		        if(obj[k].checked)
		            check_val.push(obj[k].value);
		    }
		    alert(check_val);
		    var userList = "${rows}";
		}
      
   </script>
</head>
<body>

 <div class="demo" ></div>

${msg }
<br>
<br>
<form id="myform" action="<%=path%>/queryBet.html" method="post" >
	<!-- ���ݵ����� -->
		
	<table align="center" class="table table-striped" style="background-color:#CCFFFF;opacity: 0.9;width:90%">
	   <caption align="left"><font color="white" size="5px">��Ѻע����</font> </caption>

	  <tr>
	    <td>���</td>
	    <td>����</td>
	    <td>ս��1</td>
	    <td>ս��2</td>
	    <td>������ʼʱ��</td>
	    <td>ս��1Ѻע�ܶ�</td>
	    <td>ս��2Ѻע�ܶ�</td>
	    <td>Ѻעս��1</td>
	    <td>Ѻעս��2</td>
	    <td></td>
	  </tr>
	  <!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr style="height:40px">
				    <td>${vs.count }</td>
				    <td>${ins.aac702 }</td>
				    <td>${ins.aac1103 }</td>
				    <td>${ins.aac1104 }</td>
				    <td>${ins.aac1102 }</td>
				    <td>${ins.aad102 }</td>
				    <td>${ins.aad103 }</td>
				    <td>
				      <input type="text" name="aad202${vs.count }"  value="0" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
				    </td>
				    <td>
				      <input type="text" name="aad203${vs.count }"  value="0" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
				    </td>
				   <td>
				      <a href="#" onclick="onBet('${ins.aad101}','${vs.count }')">��ע</a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
			           <tr style="height:40px">
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="15">
	            <tr style="height:40px">
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
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
	</div>
	<!-- ���ܰ�ť�� -->
	<table border="1"  align="center" >
	  <tr>
	    <td align="center">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="��ѯ">
	       <input type="submit" class="btn btn-secondary  active" name="next" value="�鿴��ʷѺע" 
	              formaction="<%=path%>/queryUserBet.html">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aab101" value="<%=aab101 %>">
</form>
<form action="<%=path%>/buyVIP.html" method="post">
<input type="search" name="month" placeholder="���뿪ͨ������" align="center" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
<input type="submit" name="next" value="��ͨ" align="center">
<input type="hidden" name="aab101" value="<%=aab101 %>">
<input type="hidden" name="aab109" value="<%=aab109 %>">
</form>
</body>
</html>