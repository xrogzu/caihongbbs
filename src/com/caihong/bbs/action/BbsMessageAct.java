package com.caihong.bbs.action;

import static com.caihong.common.page.SimplePage.cpn;

import java.util.LinkedList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caihong.common.page.Pagination;
import com.caihong.common.web.CookieUtils;
import com.caihong.bbs.entity.BbsMessage;
import com.caihong.bbs.manager.BbsMessageMng;
import com.caihong.bbs.manager.BbsMessageReplyMng;

@Controller
public class BbsMessageAct {
	private static final Logger log = LoggerFactory.getLogger(BbsMessageAct.class);
	
	@RequestMapping("/message/v_sys_list.do")
	public String sysMessagelist(Integer pageNo, HttpServletRequest request, ModelMap model) {
		Pagination pagination=bbsMessageMng.getPagination(true,cpn(pageNo), CookieUtils.getPageSize(request));
		model.addAttribute("pagination", pagination);
		return "message/syslist";
	}
	
	@RequestMapping("/message/v_list.do")
	public String messagelist(Integer pageNo, HttpServletRequest request, ModelMap model) {
		Pagination pagination=bbsMessageReplyMng.getPage(cpn(pageNo), CookieUtils.getPageSize(request));
		model.addAttribute("pagination", pagination);
		return "message/list";
	}
	
	@RequestMapping("/message/o_delete.do")
	public String delete(Boolean sys,
			Integer[] ids, Integer pageNo, HttpServletRequest request,ModelMap model) {
		ids=array_unique(ids);
		BbsMessage[] beans = bbsMessageMng.deleteByIds(ids);
		for (BbsMessage bean : beans) {
			log.info("delete BbsMessage id={}", bean.getId());
		}
		if(sys!=null){
			sys=false;
		}
		if(sys){
			return sysMessagelist(pageNo, request, model);
		}else{
			return messagelist(pageNo, request, model);
		}
	}
	
	//去除数组中重复的记录
	public static Integer[] array_unique(Integer[] a) {
	    // array_unique
	    List<Integer> list = new LinkedList<Integer>();
	    for(int i = 0; i < a.length; i++) {
	        if(!list.contains(a[i])) {
	            list.add(a[i]);
	        }
	    }
	    return (Integer[])list.toArray(new Integer[list.size()]);
	}

	
	@Autowired
	private BbsMessageMng bbsMessageMng;
	@Autowired
	private BbsMessageReplyMng bbsMessageReplyMng;
}