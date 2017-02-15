package com.caihong.bbs.ws;

import com.caihong.common.web.HttpClientUtil;

public class HttpSender {
	/**
	 * 彩虹币同步
	 * @param username
	 * @param grain
	 * @return
	 */
	public static boolean updateGrain(String username,Integer grain){
		if(username==null||username.equals("")||grain==null||grain==0){
			return false;
		}
		String url="http://www.caihongyixue.com/ws/updateGrain.jspx?username="+username+"&prestige="+grain;
		String out=HttpClientUtil.getInstance().get(url);
		if(!out.equals("0")){
			return true;
		}
		return false;
	}
	
}
