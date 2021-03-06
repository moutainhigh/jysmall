
$(document).ready(function() {
	uploadApkFile($('#appButn'), $("#appUrl1"), $("#appUrl"));
});
;

/**
 * @param butn 上传按钮
 * @param image 提示语!
 * @param hidd apk保存地址
 */
function uploadApkFile(butn, appSatus, hidd) {
	butn.uploadify({
		height : 25,
		width : 160,
		multi : false,
		method : 'post',
		debug:true,
		buttonText : '上传',
		fileObjName : 'file',
		fileSizeLimit : '20MB',
		removeCompleted : true,
		swf : '/css/uploadify.swf',
		cancelImg : '/images/cancel.png',
		fileTypeExts : '*.apk',
		uploader : '/fileUpload.do;jsessionid=' + getCookie(),
		onUploadStart : function(file) {
			var data = {};
		},
		onUploadSuccess : function(file, data, response) {
			data = eval('(' + data + ')');
			if (data.flag == 0) {
				appSatus.html("");
				appSatus.html("文件" + data.src + "上传成功!");
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