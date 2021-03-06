$(document).ready(function() {
	 $.formValidator.initConfig({formID:"registrationForm",autoTip:true,onError:function(msg){alert(msg);},inIframe:true});
	 $("#email").formValidator({onShow:"请输入邮箱",onFocus:"邮箱6-50个字符,",onCorrect:"",defaultValue:"@"}).inputValidator({min:6,max:50,onError:"你输入的邮箱长度非法,请确认"}).regexValidator({regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",onError:"你输入的邮箱格式不正确"});
	 $("#username").formValidator({onShow:"请输入用户名",onFocus:"用户名至少6个字符,最多30个字符",onCorrect:""}).inputValidator({min:6,max:30,onError:"你输入的用户名非法,请确认"})
	 //.regexValidator({regExp:"username",dataType:"enum",onError:"用户名格式不正确"})
	 $("#password").formValidator({onShow:"请输入密码",onFocus:"至少6个长度,最多20",onCorrect:""}).inputValidator({min:6,max:20,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"密码不能为空,请确认"});
	 $("#confirm_password").formValidator({onShow:"输再次输入密码",onFocus:"至少6个长度,最多20",onCorrect:""}).inputValidator({min:6,max:20,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码不能为空,请确认"}).compareValidator({desID:"password",operateor:"=",onError:"2次密码不一致,请确认"});
	 $("#recomId").formValidator({empty:true,onShow:"请输入你的推荐码，可以为空",onFocus:"必须是数字",onCorrect:"谢谢你的合作",onEmpty:"你真的不想留推荐码？"}).regexValidator({regExp:"^[0-9]\\d*$",onError:"推荐码必须是数字.!"});
	 
}); 