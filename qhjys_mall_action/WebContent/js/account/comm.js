$(function(){$("div.topsearch_xxk>a").click(function(){$("div.topsearch_xxk>a").removeClass("xxkcur");$(this).addClass("xxkcur")});$("#myCart").hover(getCartProd,function(a){$("div.indexgouwuche_tanchu").css("display","none");$("div.indextop_jiesuan>a",this).css({"background-color":"#e3e3e3","border-color":"#e3e3e3"})});$("#cartDet").find("a[name=delProd]").on("click",delCartProd);$("#switchCity,#citys").hover(function(){if($("#citys").css("display")=="none"){$("#switchCity").toggleClass("current");$("#citys").css("display","block")}},function(){if($("#citys").css("display")=="block"){$("#citys").css("display","none");$("#switchCity").toggleClass("current")}});$("#switchCity1,#citys1").hover(function(){if($("#citys1").css("display")=="none"){$("#switchCity1").toggleClass("current");$("#citys1").css("display","block")}},function(){if($("#citys1").css("display")=="block"){$("#citys1").css("display","none");$("#switchCity1").toggleClass("current")}});$("#switchCity2,#citys2").hover(function(){if($("#citys2").css("display")=="none"){$("#switchCity2").toggleClass("current");$("#citys2").css("display","block")}},function(){if($("#citys2").css("display")=="block"){$("#citys2").css("display","none");$("#switchCity2").toggleClass("current")}});$("#switchCity3,#citys3").hover(function(){if($("#citys3").css("display")=="none"){$("#switchCity3").toggleClass("current");$("#citys3").css("display","block")}},function(){if($("#citys3").css("display")=="block"){$("#citys3").css("display","none");$("#switchCity3").toggleClass("current")}});$("#myOrderForm,#orderForm").hover(function(){if($("#orderForm").css("display")=="none"){$("#myOrderForm").toggleClass("current");$("#orderForm").css("display","block")}},function(){if($("#orderForm").css("display")=="block"){$("#orderForm").css("display","none");$("#myOrderForm").toggleClass("current")}})});function search(){var b=encodeURI(encodeURI($("#keywork").val()));if(b==""){return}var a=$("div.topsearch_xxk").find("a.xxkcur").text();if(a=="搜商品"){location.href=getRootPath()+"/searchProduct.do?type=pord&keywork="+b}else{location.href=getRootPath()+"/searchStore.do?keywork="+b}}function getRootPath(){var b=window.document.location.href;var a=window.document.location.pathname;var d=b.indexOf(a);var c=b.substring(0,d);return c}var getCartProd=function(a){$("div.indextop_jiesuan>a",this).css({"background-color":"#fff","border-color":"#e3e3e3 #e3e3e3 #fff"});var b=$("div.indexgouwuche_tanchu");if(b.css("display")!="none"){return false}b.html('<ul id="cartDet"></ul>').css("display","block");$.ajax({async:true,type:"POST",url:getRootPath()+"/managermall/account/getCartProd.do",success:function(g){if(g==null||g==""){$("#cartDet").html('<div class="nopro">购物车中还没有商品，赶紧选购吧！</div>');return}var c,e,d=0,f=0;$(g).each(function(){var h=this.prodId;var i="/getProdDetail.do?prodId="+h;var k="/getStoreDetail.do?storeId="+this.storeId;c=$("<li></li>");if(this.prodName==null||this.prodName==""){var j=this.storeImg.split(",");c.append('<img src="'+j[0]+'"/>');c.append('<i><a href="'+k+'">'+this.storeName+"</a></i>")}else{c.append('<img src="'+this.prodImg+'"/>');c.append('<i><a href="'+i+'">'+this.prodName+"</a></i>")}c.append('<div class="shanchu"><p><strong>'+this.prodPrice+"×"+this.prodNum+"</strong></p></div>");e=$('<p><a name="delProd" href="javascript:;">删除</a></p>');e.find("a").data("prodId",this.prodId);e.find("a").data("createTime",this.createTime);e.find("a").data("storeId",this.storeId);e.on("click",delCartProd);c.find("div.shanchu").append(e);d+=1;f+=this.prodPrice*this.prodNum;$("#cartDet").append(c)});$("div.indextop_jiesuan_cishu").text(g.length);$("#cartDet").after("<h2><p>共<em>"+d+"</em>件商品，共计<span>"+f+'</span></p><p><a href="/managermall/account/toCartConfirm.do" class="qujiesuan">去购物车兑换</a></p></h2>');$("#div.indextop_jiesuan_cishu").text(g.length)}})};var delCartProd=function(c){var b=$(c.target).data("prodId");var d=$(c.target).data("createTime");var a=$(c.target).data("storeId");$.ajax({async:true,type:"POST",url:"/managermall/account/delCartProd.do",data:{prodId:b,createTime:d,storeId:a},success:function(e){location.href=location.href;if(e==null||e==""){location.href="/index.do"}$(c.target).closest("li").remove()}});return false};function gwc(){$.ajax({async:true,type:"POST",url:"/managermall/account/getCartProd.do",success:function(a){$("#jesuan_cisuan").text(a.length)}})};