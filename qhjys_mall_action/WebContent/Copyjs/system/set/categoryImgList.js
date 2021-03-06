$(function() {
	uploadFile($('#img1Butn'), $("#img1"), $("#img_1"));
	uploadFile($('#img2Butn'), $("#img2"), $("#img_2"));
	uploadFile($('#img3Butn'), $("#img3"), $("#img_3"));
	uploadFile($('#img4Butn'), $("#img4"), $("#img_4"));
	uploadFile($('#img5Butn'), $("#img5"), $("#img_5"));
	uploadFile($('#img6Butn'), $("#img6"), $("#img_6"));
	uploadFile($('#img7Butn'), $("#img7"), $("#img_7"));
	uploadFile($('#img8Butn'), $("#img8"), $("#img_8"));
	uploadFile($('#img9Butn'), $("#img9"), $("#img_9"));
	uploadFile($('#img10Butn'), $("#img10"), $("#img_10"));
	uploadFile($('#img11Butn'), $("#img11"), $("#img_11"));
	uploadFile($('#img12Butn'), $("#img12"), $("#img_12"));
	uploadFile($('#img13Butn'), $("#img13"), $("#img_13"));
	uploadFile($('#img14Butn'), $("#img14"), $("#img_14"));
	uploadFile($('#img15Butn'), $("#img15"), $("#img_15"));
	uploadFile($('#img16Butn'), $("#img16"), $("#img_16"));
	uploadFile($('#img17Butn'), $("#img17"), $("#img_17"));
	uploadFile($('#img18Butn'), $("#img18"), $("#img_18"));
	uploadFile($('#img19Butn'), $("#img19"), $("#img_19"));
	uploadFile($('#img20Butn'), $("#img20"), $("#img_20"));
	uploadFile($('#img21Butn'), $("#img21"), $("#img_21"));
});

/**
 * @param butn
 *            上传按钮
 * @param image
 *            图片显示控件
 * @param hidd
 *            图片地址保存控件
 */
function uploadFile(butn, image, hidd) {
	butn.uploadify({
		height : 35,
		width : 145,
		multi : false,
		method : 'post',
		buttonText : '上传',
		fileObjName : 'file',
		fileSizeLimit : '1MB',
		removeCompleted : true,
		swf : '/css/uploadify.swf',
		cancelImg : '/images/cancel.png',
		fileTypeExts : '*.jpg;*.png;*.gif',
		uploader : '/fileUpload.do;jsessionid=' + getCookie(),
		onUploadStart : function(file) {
			var data = {};
			data.delPath = image.attr('src');
			butn.uploadify('settings', 'formData', data);
		},
		onUploadSuccess : function(file, data, response) {
			data = eval('(' + data + ')');
			if (data.flag == 0) {
				image.attr('src', data.src);
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