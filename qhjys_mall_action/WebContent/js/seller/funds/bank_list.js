function delet(c){if(confirm("确定要删除吗?")){var b="id="+c;var a="/managermall/seller/funds/deleteBank.do";$.ajax({type:"post",url:a,data:b,success:function(d){if(d=="success"){alert("删除成功");window.location.href="/managermall/seller/funds/bank.do"}if(d=="error"){alert("删除失败")}},error:function(){}})}}function set(c){if(confirm("确定要设为默认吗?")){var b="id="+c;var a="/managermall/seller/funds/setBank.do";$.ajax({type:"post",url:a,data:b,success:function(d){if(d=="success"){alert("设为默认成功");window.location.href="/managermall/seller/funds/bank.do"}if(d=="error"){alert("设为默认失败")}},error:function(){}})}};