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
import com.caihong.common.web.CookieUtils;
import com.caihong.bbs.entity.BbsWebservice;
import com.caihong.bbs.manager.BbsWebserviceMng;

@Controller
public class BbsWebserviceAct {
	private static final Logger log = LoggerFactory.getLogger(BbsWebserviceAct.class);

	@RequestMapping("/webservice/v_list.do")
	public String list(Integer pageNo, HttpServletRequest request, ModelMap model) {
		Pagination pagination = manager.getPage(cpn(pageNo), CookieUtils
				.getPageSize(request));
		model.addAttribute("pagination",pagination);
		return "webservice/list";
	}

	@RequestMapping("/webservice/v_add.do")
	public String add(ModelMap model) {
		return "webservice/add";
	}

	@RequestMapping("/webservice/v_edit.do")
	public String edit(Integer id, HttpServletRequest request, ModelMap model) {
		model.addAttribute("bbsWebservice", manager.findById(id));
		return "webservice/edit";
	}

	@RequestMapping("/webservice/o_save.do")
	public String save(BbsWebservice bean, String[] paramName, String[] defaultValue,
			HttpServletRequest request, ModelMap model) {
		bean = manager.save(bean,paramName,defaultValue);
		log.info("save BbsWebservice id={}", bean.getId());
		return "redirect:v_list.do";
	}

	@RequestMapping("/webservice/o_update.do")
	public String update(BbsWebservice bean,String[] paramName, String[] defaultValue,
			Integer pageNo, HttpServletRequest request,ModelMap model) {
		bean = manager.update(bean,paramName,defaultValue);
		log.info("update BbsWebservice id={}.", bean.getId());
		return list(pageNo, request, model);
	}

	@RequestMapping("/webservice/o_delete.do")
	public String delete(Integer[] ids, Integer pageNo, HttpServletRequest request,
			ModelMap model) {
		manager.deleteByIds(ids);
		return list(pageNo, request, model);
	}
	
	@Autowired
	private BbsWebserviceMng manager;
}