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
import com.caihong.bbs.entity.BbsLimit;
import com.caihong.bbs.manager.BbsLimitMng;

@Controller
public class BbsLimitAct {
	private static final Logger log = LoggerFactory.getLogger(BbsLimitAct.class);

	@RequestMapping("/bbslimit/v_list.do")
	public String list(Integer pageNo, HttpServletRequest request, ModelMap model) {
		Pagination pagination = manager.getPage(cpn(pageNo), CookieUtils
				.getPageSize(request));
		model.addAttribute("pagination",pagination);
		return "bbslimit/list";
	}

	@RequestMapping("/bbslimit/v_add.do")
	public String add(ModelMap model) {
		return "bbslimit/add";
	}

	@RequestMapping("/bbslimit/v_edit.do")
	public String edit(Integer id, HttpServletRequest request, ModelMap model) {
		model.addAttribute("bbsLimit", manager.findById(id));
		return "bbslimit/edit";
	}

	@RequestMapping("/bbslimit/o_save.do")
	public String save(BbsLimit bean, HttpServletRequest request, ModelMap model) {
		bean = manager.save(bean);
		log.info("save BbsLimit id={}", bean.getId());
		return "redirect:v_list.do";
	}

	@RequestMapping("/bbslimit/o_update.do")
	public String update(BbsLimit bean, Integer pageNo, HttpServletRequest request,
			ModelMap model) {
		bean = manager.update(bean);
		log.info("update BbsLimit id={}.", bean.getId());
		return list(pageNo, request, model);
	}

	@RequestMapping("/bbslimit/o_delete.do")
	public String delete(Integer[] ids, Integer pageNo, HttpServletRequest request,
			ModelMap model) {
		BbsLimit[] beans = manager.deleteByIds(ids);
		for (BbsLimit bean : beans) {
			log.info("delete BbsLimit id={}", bean.getId());
		}
		return list(pageNo, request, model);
	}
	
	@Autowired
	private BbsLimitMng manager;
}