package com.caihong.bbs.action.directive;

import static com.caihong.common.web.freemarker.DirectiveUtils.OUT_LIST;
import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.caihong.bbs.entity.BbsFriendShip;
import com.caihong.bbs.entity.BbsUser;
import com.caihong.bbs.manager.BbsFriendShipMng;
import com.caihong.bbs.web.CmsUtils;
import com.caihong.common.web.freemarker.DirectiveUtils;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;


public class MyFriendListDirective implements TemplateDirectiveModel {
	public static final String PARAM_USERID = "userId";

	@SuppressWarnings("unchecked")
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		Integer userId = getUserId(params);
		List<BbsFriendShip> list = bbsFriendShipMng.getListByUserId(userId);
		Map<String, TemplateModel> paramWrap = new HashMap<String, TemplateModel>(params);
		paramWrap.put(OUT_LIST, DEFAULT_WRAPPER.wrap(list));
		Map<String, TemplateModel> origMap = DirectiveUtils
				.addParamsToVariable(env, paramWrap);
		body.render(env.getOut());
		DirectiveUtils.removeParamsFromVariable(env, paramWrap, origMap);
	}

	private Integer getUserId(Map<String, TemplateModel> params)
			throws TemplateException {
		Integer userId = DirectiveUtils.getInt(PARAM_USERID, params);
		return userId == null ? 0 : userId;
	}

	@Autowired
	private BbsFriendShipMng bbsFriendShipMng;
}
