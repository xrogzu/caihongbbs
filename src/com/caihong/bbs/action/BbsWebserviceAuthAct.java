package com.caihong.bbs.action;

import static com.caihong.common.page.SimplePage.cpn;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caihong.common.page.Pagination;
import com.caihong.common.security.encoder.Md5PwdEncoder;
import com.caihong.common.web.CookieUtils;
import com.caihong.core.web.WebErrors;
import com.caihong.bbs.entity.BbsWebserviceAuth;
import com.caihong.bbs.manager.BbsWebserviceAuthMng;

@Controller
public class BbsWebserviceAuthAct {
	private static final Logger log = LoggerFactory.getLogger(BbsWebserviceAuthAct.class);

	@RequestMapping("/webserviceAuth/v_list.do")
	public String list(Integer pageNo, HttpServletRequest request, ModelMap model) {
		Pagination pagination = manager.getPage(cpn(pageNo), CookieUtils
				.getPageSize(request));
		model.addAttribute("pagination",pagination);
		return "webserviceAuth/list";
	}

	@RequestMapping("/webserviceAuth/v_add.do")
	public String add(ModelMap model) {
		return "webserviceAuth/add";
	}

	@RequestMapping("/webserviceAuth/v_edit.do")
	public String edit(Integer id, HttpServletRequest request, ModelMap model) {
		model.addAttribute("bbsWebserviceAuth", manager.findById(id));
		return "webserviceAuth/edit";
	}

	@RequestMapping("/webserviceAuth/o_save.do")
	public String save(BbsWebserviceAuth bean, HttpServletRequest request, ModelMap model) {
		bean.setPassword(pwdEncoder.encodePassword(bean.getPassword()));
		bean = manager.save(bean);
		log.info("save BbsWebserviceAuth id={}", bean.getId());
		return "redirect:v_list.do";
	}

	@RequestMapping("/webserviceAuth/o_update.do")
	public String update(Integer id,String username,String password,String system,Boolean enable, Integer pageNo, HttpServletRequest request,
			ModelMap model) {
		BbsWebserviceAuth bean = manager.update(id, username, password, system, enable);
		log.info("update BbsWebserviceAuth id={}.", bean.getId());
		return list(pageNo, request, model);
	}

	@RequestMapping("/webserviceAuth/o_delete.do")
	public String delete(Integer[] ids, Integer pageNo, HttpServletRequest request,
			ModelMap model) {
		manager.deleteByIds(ids);
		return list(pageNo, request, model);
	}
	
	@Autowired
	private BbsWebserviceAuthMng manager;
	@Autowired
	private Md5PwdEncoder pwdEncoder;
}