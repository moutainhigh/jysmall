<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="/WEB-INF/jsp/public_header.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>飞券网平台管理中心</title>
<script type="text/javascript" src="/js/pagingUtil.js"></script>
<script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css">
<script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/system/ad/hongbao_list.js"></script>
</head>

<body>
<!-------------------top---------------------------------------------------------------------->
<jsp:include page="/WEB-INF/jsp/system/system_header.jsp" flush="true" ><jsp:param name="val" value="11" /></jsp:include>
<!--------------------------我的账户-------------------------------------------------------->
<div class="membercontent">
	<!----------------左侧----------------------->
	<jsp:include page="/WEB-INF/jsp/system/message/uLeft.jsp" flush="true" ><jsp:param name="position" value="6" /></jsp:include>
    <!--------------右侧------------------>
	<div class="memberright">
        <h3 style="padding-left:10px; margin-bottom:25px;">红包活动列表</h3>
         <p class="clearfix">

		        	<label class="one" for="con-email4" >商家ID：</label>
		        	<input class="con-email4" name="productName" value="${productName}" >
		            <label class="one" for="con-email4" >店铺名称：</label>
		        	<input class="con-email4" name="storeName" value="${storeName}" >
                     <label for="select">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input type="submit" value="查询" class="submit8">
            	    <input type="button" value="新建活动" class="submitred"  onclick="javascript:xingjian()" style="float:right;" > 
           </p>
         <form id="from"  class="zcform1" method="post" action="/managermall/systemmall/ad/hongbao_list.do">
         	<input id="page" name="pageNum" type="hidden" value="${pageNum }">
         </form>
        <div class="member_myorder">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>  
                    <th class="td160">活动名称</th>
                     <th class="td160">店铺名称</th>
                     <th class="td80">商家ID</th>
                    <th class="180">活动时间</th>
                    <th class="td160">状态</th>
                    <th class="td100">其他</th>
                    <th class="td100">操作</th>
                </tr>

                <c:forEach items="${page}" var="s">
                <tr>
                    <td class="td160">${s.activityName }</td>
                    <td class="td160">${s.storeName }</td>
                    <td class="td80">${s.storeId }</td>
                    <td class="td180" style=" text-align:center">
                    <fmt:formatDate value="${s.beginDate}" pattern="yyyy-MM-dd"/>-
                    <fmt:formatDate value="${s.endDate}" pattern="yyyy-MM-dd"/></td>
                    <td class="td160">
                    	<a href="javascript:updateStatus('1','${s.id }')" <c:choose><c:when test="${s.status==1 }">class="m-iconhref-current"</c:when><c:otherwise>class="m-iconhref"</c:otherwise></c:choose>
                    		><span class="m-icon1"></span></a>
                    	<a href="javascript:updateStatus('2','${s.id }')" <c:choose><c:when test="${s.status==2 }">class="m-iconhref-current"</c:when><c:otherwise>class="m-iconhref"</c:otherwise></c:choose>
                    		><span class="m-icon2"></span></a>
                    	<a href="javascript:updateStatus('0','${s.id }')" <c:choose><c:when test="${s.status==0 }">class="m-iconhref-current"</c:when><c:otherwise>class="m-iconhref"</c:otherwise></c:choose>
							><span class="m-icon3"></span></a></td>
                    <td class="td100"><a href="/managermall/systemmall/ad/hongbao_detail.do?redpackId=${s.id }">详情</a></td>  
                    <td class="td100"><a href="javascript:deleteactivity('${s.id }')" class="submitblue">删除</a></td>
                </tr>
                </c:forEach>
              </table>
        </div>
        <!--上一页下一页-->
         <div class="page">
            	<c:if test="${page.getPageNum()>1}">
            	<a href="javascript:previousPage(${page.getPageNum()-1},'from','page')" class="prev">上一页</a>
            	</c:if>
            	<c:choose>
            	<c:when test="${page.getPages()<7}">
            		<c:forEach var="i" begin="1" end="${page.getPages()}">
            			<c:choose><c:when test="${i==page.getPageNum()}"><em class="current">${i}</em></c:when>
            			<c:otherwise><a href="javascript:previousPage(${i},'from','page')">${i}</a></c:otherwise></c:choose>
            		</c:forEach>
            	</c:when>
            	<c:when test="${page.getPages()>6}">
            		<c:forEach var="i" begin="1" end="3">
            			<c:choose><c:when test="${i==page.getPageNum()}"><em class="current">${i}</em></c:when>
            			<c:otherwise><a href="javascript:previousPage(${i},'from','page')">${i}</a></c:otherwise></c:choose>
            		</c:forEach>
            		<c:if test="${page.getPageNum()>4}"><em>...</em></c:if>
            		<c:forEach var="i" begin="4" end="${page.getPages()-3}">
            			<c:if test="${i==page.getPageNum()}"><em class="current">${i}</em></c:if>
            		</c:forEach>
            		<c:if test="${page.getPageNum()<page.getPages()-3}"><em>...</em></c:if>
            		<c:forEach var="i" begin="${page.getPages()-2}" end="${page.getPages()}">
            			<c:choose><c:when test="${i==page.getPageNum()}"><em class="current">${i}</em></c:when>
            			<c:otherwise><a href="javascript:previousPage(${i},'from','page')">${i}</a></c:otherwise></c:choose>
            		</c:forEach>
            	</c:when>
            	</c:choose>
            	<c:if test="${page.getPages()>page.getPageNum()}"><a href="javascript:previousPage(${page.getPageNum()+1},'from','page')" class="next">下一页</a></c:if>
               <span>共${page.getPages()}页</span><span>到第</span>
               <input class="input1" id="jumPage" name="pageNum" type="text" value="${page.getPageNum()}" onkeydown="if(event.keyCode==13){previousPage(this.value,'from','page')}"/><span>页</span>
        </div>
	</div>
	<div class="clear"></div>
</div>
<!------------------------------底部---------------------------------------------->
<jsp:include page="/WEB-INF/jsp/system/system_footer.jsp" />
<!--底部-e-->
</body>
</html>
