function delet(c){if(confirm("确定删除吗?")){var b="id="+c;var a="/managermall/account/order/deleteOrderForm.do";$.ajax({type:"post",url:a,data:b,dataType:"html",success:function(d){if(d=="scuess"){alert("删除成功");window.location.href="/managermall/account/order/myOrderForm.do"}if(d=="error"){alert("删除失败")}},error:function(){}})}else{}}function seletct(a){window.location.href="/managermall/account/order/myOrderForm.do?status="+a.value}function submitApply(a){$.ajax({type:"post",url:"/managermall/account/refund/virtualProRefund.do",data:{detailId:a},dataType:"html",success:function(b){if(b=="success"){alert("退款成功");window.location.href="/managermall/account/order/myOrderForm.do"}else{alert(b)}},error:function(){}})}function delivery(a){if(confirm("是否确认收货")){$.ajax({type:"post",url:"/managermall/account/refund/delivery.do",data:{detailId:a},dataType:"html",success:function(b){if(b=="确认收货成功"){alert(b);window.location.href="/managermall/account/order/myOrderForm.do"}else{alert(b)}},error:function(){}})}};