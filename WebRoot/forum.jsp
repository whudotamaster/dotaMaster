<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
tr 
{
	height: 25px;
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
</style>

</head>
<body >
	${msg }
<%@ include file="header.jsp" %>
	<br>
	<br>
	<form id="myform" action="<%=path%>/forum.html" method="post">
		<!-- ��ѯ������ -->
		<table border="1" width="95%" align="center">
			<tr>
				<td colspan="4">��ѯ����</td>
			</tr>
			<tr>
				<td>��ѯ����</td>
				<td colspan="2"><e:text name="aab502" /></td>
			</tr>
			<tr>
				<td>����</td>
				<td><e:radio name="aab506" value="��ͨ��:0,������:1" defval="0" /></td>
				<td>
					<c:choose>
				<c:when test="<%= aab101!=null %>">
					<input type="submit"
					id="addPost" name="next" value="����" formaction="<%=path%>/addPostOnLoad.html">
				</c:when>
				<c:otherwise>
						<input type="submit"
					id="addPost" name="next" value="����" formaction="<%=path%>/login.html">
				</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
		<!-- ���ݵ����� -->
		<table border="1" width="95%" align="center">
			<tr>
				<c:if test="${tag}">
				<td></td>
				</c:if>
				<td>������</td>
				<td>������</td>
				<td>�ظ���</td>
				<td>ʱ��</td>	
				<c:if test="${tag}">
				<td>
				</td>
				</c:if>	
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
					<c:forEach items="${rows }" var="ins" varStatus="vs" begin="1">
						<tr>
						<c:if test="${tag}">
						<td>
							<input type="checkbox" name="idlist"
								value="${ins.aab501 }" onclick="onSelect(this.checked)">
						
							</td>
								</c:if>
							<td>
							<!-- #  ��ê --> 
							<c:if test="${(rows[0].aab107)/100 >= ins.aab507 || ins.aab101 == aab101}">
							<a href="#" onclick="onVisit('${ins.aab501 }','${ins.aab507 }')">${ins.aab502 }</a>
							</c:if>
							<c:if test="${(rows[0].aab107)/100 < ins.aab507 && ins.aab101 != aab101 }">
							<a href="#" onclick="alert('����Ҫ${ins.aab507}�������ϲ��ܹۿ�������');" style="color:#FF2222 ">------����Ҫ${ins.aab507}�������ϲ��ܹۿ�������------</a>
							</c:if>
							</td>
							<td>
								<!-- #  �û�����ͷ��--> 
								<a href="#" onclick="onCheck('${ins.aab101}')">${ins.aab102 }</a>
								<img src="/Avatar/${ins.aab105}" class="round_icon"
								onclick="onCheck('${ins.aab101}')">
							</td>
							<td>${ins.aab505 }</td>
							<td>${ins.aab504 }</td>
							<c:if test="${tag}">
							<td>
							<a href="#" onclick="onDel('${ins.aab501}')">ɾ��</a>
							</td>
							</c:if>	
						</tr>
					</c:forEach>
					<!-- ������� -->
					<c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
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
					<c:forEach begin="1" step="1" end="15">
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
		<!-- ���ܰ�ť�� -->
		<table border="1" width="95%" align="center">
			<tr>
				<td align="center"><input type="submit" name="next" value="��ѯ">
					<c:if test="${tag }">
					<input type="submit"
					id="goodPost" name="next" value="�Ӿ�" formaction="<%=path%>/goodPost.html"
					disabled="disabled">
					<input type="submit"
					id="delPost" name="next" value="ɾ��" formaction="<%=path%>/delPost.html"
					disabled="disabled">
					</c:if>
					<c:if test="${ aab101 !=null }">
					<input type="submit"
					id="collectionPase" name="next" value="�ղ�ҳ��" 
					formaction="<%=path%>/queryCollection.html">
					<input type="submit"
					id="historyPase" name="next" value="�vʷ�l��" 
					formaction="<%=path%>/queryHistoryById.html">
					</c:if>
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
    	 if(${aab507/100 >= vaab507+0}){
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