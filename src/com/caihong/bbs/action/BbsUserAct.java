package com.caihong.bbs.action;

import static com.caihong.common.page.SimplePage.cpn;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caihong.bbs.entity.BbsUser;
import com.caihong.bbs.entity.BbsUserExt;
import com.caihong.bbs.entity.BbsUserGroup;
import com.caihong.bbs.entity.BbsWebservice;
import com.caihong.bbs.manager.BbsUserGroupMng;
import com.caihong.bbs.manager.BbsUserMng;
import com.caihong.bbs.manager.BbsWebserviceMng;
import com.caihong.bbs.web.CmsUtils;
import com.caihong.common.page.Pagination;
import com.caihong.common.web.CookieUtils;
import com.caihong.common.web.RequestUtils;
import com.caihong.common.web.ResponseUtils;
import com.caihong.core.entity.CmsConfigItem;
import com.caihong.core.entity.CmsSite;
import com.caihong.core.manager.CmsConfigItemMng;

@Controller
public class BbsUserAct {
	private static final Logger log = LoggerFactory
			.getLogger(BbsUserGroupAct.class);

	@RequestMapping("/user/v_list.do")
	public String list(String username, Integer groupId,Integer lastLoginDay,
			Integer orderBy, Integer pageNo, HttpServletRequest request,
			ModelMap model) {
		Pagination pagination = manager.getPage(username, null, groupId, null,
				false,false,lastLoginDay, orderBy,cpn(pageNo), CookieUtils.getPageSize(request));
		CmsSite site = CmsUtils.getSite(request);
		List<BbsUserGroup> groupList = bbsUserGroupMng.getList(site.getId());
		model.addAttribute("groupList", groupList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("username", username);
		model.addAttribute("groupId", groupId);
		model.addAttribute("orderBy", orderBy);
		model.addAttribute("pageNo", pagination.getPageNo());
		return "user/list";
	}
	
	@RequestMapping("/user/v_officialuser_list.do")
	public String listOfficialUserList(Integer pageNo, HttpServletRequest request,ModelMap model) {
		Pagination pagination = manager.getPage(null, null, null, null,
				false,true,null, null,cpn(pageNo), CookieUtils.getPageSize(request));
		model.addAttribute("pagination", pagination);
		model.addAttribute("pageNo", pagination.getPageNo());
		return "user/listOfficialUser";
	}

	@RequestMapping("/user/o_onlinestatistics.do")
	public String onlinestatistics(Integer[] ids, Integer pageNo,
			HttpServletRequest request, ModelMap model) {
		BbsUser[] beans = manager.deleteByIds(ids);
		for (BbsUser bean : beans) {
			log.info("delete BbsUser id={}", bean.getId());
		}
		return "redirect:v_list.do";
	}

	@RequestMapping("/user/v_add.do")
	public String add(HttpServletRequest request, ModelMap model) {
		CmsSite site = CmsUtils.getSite(request);
		List<BbsUserGroup> groupList = bbsUserGroupMng.getList(site.getId());
		List<CmsConfigItem>registerItems=cmsConfigItemMng.getList(site.getConfig().getId(), CmsConfigItem.CATEGORY_REGISTER);
		model.addAttribute("registerItems", registerItems);
		model.addAttribute("groupList", groupList);
		return "user/add";
	}

	@RequestMapping("/user/v_edit.do")
	public String edit(Integer userId, HttpServletRequest request,
			ModelMap model) {
		CmsSite site = CmsUtils.getSite(request);
		BbsUser user = manager.findById(userId);
		List<BbsUserGroup> groupList = bbsUserGroupMng.getList(site.getId());
		List<CmsConfigItem>registerItems=cmsConfigItemMng.getList(site.getConfig().getId(), CmsConfigItem.CATEGORY_REGISTER);
		List<String>userAttrValues=new ArrayList<String>();
		for(CmsConfigItem item:registerItems){
			userAttrValues.add(user.getAttr().get(item.getField()));
		}
		model.addAttribute("groupList", groupList);
		model.addAttribute("cmsMember",user);
		model.addAttribute("registerItems", registerItems);
		model.addAttribute("userAttrValues", userAttrValues);
		return "user/edit";
	}
	
	@RequestMapping("/user/v_officialuser_add.do")
	public String addOfficialUser(HttpServletRequest request, ModelMap model) {
		CmsSite site = CmsUtils.getSite(request);
		List<BbsUserGroup> groupList = bbsUserGroupMng.getList(site.getId());
		model.addAttribute("groupList", groupList);
		return "user/addOfficialUser";
	}

	@RequestMapping("/user/v_officialuser_edit.do")
	public String editOfficialUser(Integer userId, HttpServletRequest request,
			ModelMap model) {
		CmsSite site = CmsUtils.getSite(request);
		BbsUser user = manager.findById(userId);
		List<BbsUserGroup> groupList = bbsUserGroupMng.getList(site.getId());
		model.addAttribute("groupList", groupList);
		model.addAttribute("cmsMember",user);
		return "user/editOfficialUser";
	}
	
	@RequestMapping(value = "/user/v_check_username.do")
	public void checkUsername(String username, HttpServletResponse response) {
		String pass;
		if (StringUtils.isBlank(username)) {
			pass = "false";
		} else {
			pass = manager.usernameNotExist(username) ? "true" : "false";
		}
		ResponseUtils.renderJson(response, pass);
	}

	@RequestMapping("/user/o_save.do")
	public String save(BbsUser bean, BbsUserExt ext, String username,Boolean official,
			String email, String telphone,String password, Integer groupId,
			HttpServletRequest request, ModelMap model) throws UnsupportedEncodingException, MessagingException {
		String ip = RequestUtils.getIpAddr(request);
		Map<String,String>attrs=RequestUtils.getRequestMap(request, "attr_");
		bean = manager.registerMember(username, email,telphone,official, password, ip, groupId,ext,attrs,null);
		callWebService(username, password, email,telphone, groupId,ext,BbsWebservice.SERVICE_TYPE_ADD_USER);
		if(official!=null&&official){
			return "redirect:v_officialuser_list.do";
		}else{
			return "redirect:v_list.do";
		}
	}

	@RequestMapping("/user/o_update.do")
	public String update(Integer id, String email,String telphone, String password,
			Boolean disabled, BbsUserExt ext, Integer groupId,
			HttpServletRequest request, ModelMap model) {
		Map<String,String>attrs=RequestUtils.getRequestMap(request, "attr_");
		BbsUser bean=manager.updateMember(id, email, telphone,password, disabled, null, null, ext,attrs,groupId);
		callWebService(bean.getUsername(), password, email, telphone,groupId,ext,BbsWebservice.SERVICE_TYPE_UPDATE_USER);
		if(bean.getOfficial()!=null&&bean.getOfficial()){
			return "redirect:v_officialuser_list.do";
		}else{
			return "redirect:v_list.do";
		}
	}
	
	@RequestMapping("/user/o_delete.do")
	public String delete(Integer[] ids, Boolean official,Integer pageNo,
			HttpServletRequest request, ModelMap model) {
		BbsUser[] beans = manager.deleteByIds(ids);
		for (BbsUser bean : beans) {
			Map<String,String>paramsValues=new HashMap<String, String>();
			paramsValues.put("username", bean.getUsername());
			bbsWebserviceMng.callWebService(BbsWebservice.SERVICE_TYPE_DELETE_USER, paramsValues);
			log.info("delete BbsUser id={}", bean.getId());
		}
		if(official!=null&&official){
			return "redirect:v_officialuser_list.do";
		}else{
			return "redirect:v_list.do";
		}
	}
		
	private void callWebService(String username,String password,String email,String telphone,Integer groupId,BbsUserExt userExt,String operate){
		if(bbsWebserviceMng.hasWebservice(operate)){
			Map<String,String>paramsValues=new HashMap<String, String>();
			paramsValues.put("username", username);
			if(StringUtils.isNotBlank(password)){
				paramsValues.put("password", password);
			}
			if(StringUtils.isNotBlank(email)){
				paramsValues.put("email", email);
			}
			if(StringUtils.isNotBlank(telphone)){
				paramsValues.put("telphone", telphone);
			}
			if(StringUtils.isNotBlank(userExt.getRealname())){
				paramsValues.put("realname", userExt.getRealname());
			}
			if(userExt.getGender()!=null){
				paramsValues.put("sex", userExt.getGender().toString());
			}
			if(StringUtils.isNotBlank(userExt.getMoble())){
				paramsValues.put("tel",userExt.getMoble());
			}
			if(groupId!=null){
				paramsValues.put("groupId",groupId+"");
			}
			bbsWebserviceMng.callWebService(operate, paramsValues);
		}
	}

	@Autowired
	private BbsWebserviceMng bbsWebserviceMng;
	@Autowired
	private BbsUserGroupMng bbsUserGroupMng;
	@Autowired
	private BbsUserMng manager;
	@Autowired
	private CmsConfigItemMng cmsConfigItemMng;
}
