<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-itunes-app"/>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="/js/weixin/rebatestore3.js" type="text/javascript"></script>
<c:if test="${map.payType == 1}"><script src="/js/weixin/jweixin-1.0.0.js"/></script></c:if>
<c:if test="${map.payType == 2}"><script src="/js/weixin/qqapi.js"></script></c:if>
<c:if test="${map.payType == 0}"><script src="https://as.alipayobjects.com/g/component/antbridge/1.1.1/antbridge.min.js"></script></c:if>
<title>向商家付款-${map.name}</title>
<link href="/css/zhifu2.css" type="text/css" rel="stylesheet" />
</head>

<body style="background:#fff" onload="javascript:form1.text1.focus();">

	<input type ="hidden" id="rebateId" name="rebateId" value="${map.id}" > 
    <input type ="hidden" id="sellerId" name="sellerId" value="${map.sellerId} "> 
    <input type ="hidden" id="storeId" name="storeId" value="${map.storeId}"> 
    <input type ="hidden" id="rebate" name="rebate" value="${map.rebate}">
    <input type ="hidden" id="storeName" name="storeName" value="${map.name} ">
    <input type ="hidden" id="openId" name="openId" value="${map.openId}">
    <input type ="hidden" id="nickname" name="nickname" value="${map.nickname}">
    <input type ="hidden" id="headimgurl" name="headimgurl" value="${map.headimgurl}">
     <input type="hidden" value="${map.payType}" id="payType">
<div class="paymentallbox">
	<div class="paytitle"><img src="/images/weixin/payjxw.png" ><p>${map.name}</p></div>
	<div class="payinput"><span>输入消费金额(￥)</span>
    	<form name="form1">
        <input id="totamt" readonly="readonly" value="" name="text1" type="text"step="0.01"/>
        <script>
        	 $("#totamt").onmousedown = function (e) { e.preventDefault(); }
         </script>
      </form>
    </div> 
   <!-- <div class="payquan">
    	 <ul>
        	<li><span class="jian">减</span>卡劵：满100减10<span class="shiyong">使用 <input name="" type="checkbox" value="" checked></span></li>
        </ul> 
        <p class="shifu">实际支付：<span class="red">￥299</span></p>
    </div>   -->
</div>
<div class="payadv">
  <div class="bg"><span><img src="/images/weixin/payfq.png" > | 提供技术支持服务</span></div>
</div>
<script type="text/javascript" src="/js/weixin/keyboardnew.js"></script>
<script type="text/javascript">
(function(){
	var input1 = document.getElementById('totamt');
	
	
	//alert("1")
		new KeyBoard(input1);
	 // alert("2")
	input1.onclick = function(){
		new KeyBoard(input1);
	};
	
})();
</script>
</body>
</html>