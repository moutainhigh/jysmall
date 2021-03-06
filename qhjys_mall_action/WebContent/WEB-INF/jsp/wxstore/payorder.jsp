<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% 
if(null!=request.getHeader("user-agent")&&((request.getHeader("user-agent").toLowerCase().indexOf("iphone")!=-1 || request.getHeader("user-agent").toLowerCase().indexOf("android")!=-1
|| request.getHeader("user-agent").toLowerCase().indexOf("ipad")!=-1
|| request.getHeader("user-agent").toLowerCase().indexOf("linux")!=-1))) 
{ 

}else{

	return ;
}  
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-itunes-app"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>订单确认</title>
<link href="/css/zhifu.css" type="text/css" rel="stylesheet" />
<link href="/css/form.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/weixin/jweixin-1.0.0.js"/></script>
<script type="text/javascript" src="/js/formcheck.js"></script>
<script type="text/javascript" src="/js/wxstore/topayorder1.js"></script>
</head>
<body>
	
<div class="orderdetail">
   <div class="orderdetailbox">
   		<ul>
            <!--<li>当前已选择时间<div class="right"><span class="red"><fm:formatDate value="${order.preordainDate}" pattern="yyyy-MM-dd HH:mm"/></span></div></li>
            <li>当前已确定用餐人数<div class="right"><span class="red">${order.peopleNum }位</span></div></li>
            <li>联系人姓名
                <div class="right"><span class="red">${order.contacts }</span>
                <form accept-charset="utf-8" method="get" action="#" style="padding-left:60px;">
                    <fieldset class="radios">
                        <label for="radio-01" class="label_radio">
                            <-input name="sample-radio" type="radio" id="radio-01" value="1" disabled <c:if test="${order.contactsSex==1 }">checked="checked"</c:if> />先生
                      </label>
                        <label for="radio-02" class="label_radio">
                            <-input type="radio" value="1" id="radio-02" name="sample-radio" disabled value="2" <c:if test="${order.contactsSex==2 }">checked="checked"</c:if>/>女士
                        </label>
                    </fieldset>
                </form>
                </div>
            </li>
            <li>联系人电话<div class="right"><span class="red">${order.phoneNum }</span></div></li>-->
            <li style="border-bottom:0;">
            	<div class="canzhuohao">餐桌号<div class="right"style="margin-right:10px; font-size:1.15em;"><span class="red">${order.deskNo }</span></div></div>
            </li>
            <li>当前已选择菜品：</li>
            <li>
                <ul>
                <c:forEach items="${details }" var="detail">
                	<li><span class="arr">·</span>${detail.productName }<span class="red">×${detail.quantity }</span></li>
                </c:forEach>
                    <div class="clear"></div>
                </ul>
            </li>
            <li>共计<span class="red">${totleNum }</span>份 合计：<span class="red">¥<fm:formatNumber value="${order.totalAmount }" type="currency" pattern="0.00"/></span>
            <div class="right">折扣价：<span class="red">¥<fm:formatNumber value="${order.rebateAmount }" type="currency" pattern="0.00"/></span></div>
            </li>
        </ul>
   </div>
   
</div>
<div class="orderbottombox">
	<input type="hidden" value="${channelVali }" id="channelVali">
	<input type="hidden" value="${order.id }" id="orderId">
	<input type="hidden" value="${order.rebateAmount }" id="rebateAmount">
	<input type="hidden" value="${store.proportion }" id="proportion">
	<input type="hidden" value="${user_openid}" id="openId">
	<input type="hidden" value="1" id="payType">
	<!--<div class="orderbuttonbox"><span class="button1"><a href="javascript:yudingfukuan();" id="yuding" class="current">支付定金</a></span>
    	<span class="button2"><a href="javascript:quanefukuan();" id="quane">全额支付</a></span>
    </div>
    <div class="orderbuttonbox"><span class="button1"><a href="javascript:yudingfukuan();" id="yuding" >支付宝支付</a></span>
    	<span class="button2"><a href="javascript:quanefukuan();" id="quane" class="current">微信支付</a></span>
    </div>-->
	<div class="shifu">实付金额  <span class="red" id="shifujine">¥<fm:formatNumber value="${order.rebateAmount}" type="currency" pattern="0.00"/></span></div>
	<div class="paybutton"><a href="javascript:payorder();">确认支付</a></div>
</div>
<div id="alipaydiv"></div>
</body>
</html>