package cn.qhjys.mall.weixin.bean.message.massmessage;

import java.util.HashMap;
import java.util.Map;

import cn.qhjys.mall.weixin.bean.message.preview.ImagePreview;
import cn.qhjys.mall.weixin.bean.message.preview.Preview;

public class MassImageMessage extends MassMessage{

	private Map<String, String> image;

	public MassImageMessage(String media_id) {
		super();
		image = new HashMap<String, String>();
		image.put("media_id",media_id);
		super.msgtype = "image";
	}

	public Map<String, String> getImage() {
		return image;
	}

	public void setImage(Map<String, String> image) {
		this.image = image;
	}

	@Override
	public Preview convert() {
		Preview preview = new ImagePreview(image.get("media_id"));
		if(this.getTouser()!=null && this.getTouser().size()>0){
			preview.setTouser(this.getTouser().iterator().next());
		}
		return preview;
	}
	
}
