package com.caihong.bbs.action.front;



import java.util.List;

import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caihong.bbs.entity.BbsUser;
import com.caihong.bbs.manager.BbsUserMng;
import com.caihong.bbs.ws.HttpSender;
import com.caihong.common.web.ResponseUtils;

@Controller
public class BbsWebserviceAct {
	@Autowired
	private BbsUserMng bbsUserMng;
	/**
	 * 彩虹币同步
	 * @param response
	 * @param username
	 * @param pageSize
	 */
	@RequestMapping("/ws/updateGrain.jspx")
	public void updateGrain(HttpServletResponse response,String username,Integer prestige){
		if(username==null||username.equals("")||prestige==null||prestige==0){
			ResponseUtils.renderJson(response, "0");
		}else{
			
				BbsUser user=bbsUserMng.updatePrestigeCnt(username, prestige,true);
				if(user!=null){
					ResponseUtils.renderJson(response, "1");
				}else{
					ResponseUtils.renderJson(response, "0");
			}
		}
	}
	
	/**
	 * 临时同步论坛积分到cms
	 * @param response
	 */
	@RequestMapping("/ws/updateUsersGrain.jspx")
	public void updateUsersGrain(HttpServletResponse response){
		List<BbsUser> list=bbsUserMng.getList(null);
		if(list!=null&&list.size()>0){
			for(BbsUser user:list){
				if(user.getPrestige()>0){
					int grain=user.getPrestige().intValue();
					HttpSender.updateGrain(user.getUsername(), grain);
					
				}
			}
			ResponseUtils.renderJson(response, "1");
		}else{
			ResponseUtils.renderJson(response, "0");
		}
	}
}
