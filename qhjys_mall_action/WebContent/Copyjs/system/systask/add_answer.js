$(function(){
	uploadFile($('#update1'), $("#info1"), $("#img2u"));
	$("#answerType").change(function(){
		if ($("#answerType").val()==0) {
			$("#answerC").show();
			$("#imageUrl").hide();
			$("#upimgdiv").hide();
		}else if($("#answerType").val()==1){
			$("#imageUrl").show();
			$("#upimgdiv").show();
			$("#answerC").hide();
		}else{
			$("#imageUrl").hide();
			$("#upimgdiv").hide();
			$("#answerC").hide();
		}
	});
});
function uploadFile(butn, image, hidd) {
	butn.uploadify({
		height : 35,
		width : 80,
		multi : false,
		method : 'post',
		buttonText : '上传',
		fileObjName : 'file',
		fileSizeLimit : '1MB',
		removeCompleted : true,
		swf : '/css/uploadify.swf',
		cancelImg : '/images/cancel.png',
		fileTypeExts :'*.jpg;*.png;*.gif',
		uploader : '/fileUpload.do;jsessionid=' + getCookie(),
		onUploadStart : function(file) {
			var data = {};
			data.delPath = image.val();
			butn.uploadify('settings', 'formData', data);
		},
		onUploadSuccess : function(file, data, response) {
			data = eval('(' + data + ')');
			if (data.flag == 0) {
				image.val(data.src);
				hidd.val(data.src);
			} else
				alert(data.state);
		}
	});
}

function getCookie() {
	var c_name = 'JSESSIONID';
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=")
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1
			c_end = document.cookie.indexOf(";", c_start)
			if (c_end == -1)
				c_end = document.cookie.length
			return unescape(document.cookie.substring(c_start, c_end));
		}
	}
}


