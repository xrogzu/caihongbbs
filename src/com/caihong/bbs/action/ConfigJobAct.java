package com.caihong.bbs.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.caihong.bbs.manager.BbsConfigMng;
import com.caihong.core.entity.CmsSite;
import com.caihong.core.manager.CmsSiteMng;

public class ConfigJobAct {

	public void dayClear() {
		List<CmsSite> siteList = cmsSiteMng.getList();
		if (siteList != null && siteList.size() > 0) {
			for (CmsSite site : siteList) {
				bbsConfigMng.updateConfigForDay(site.getId());
			}
		}
	}

	@Autowired
	private BbsConfigMng bbsConfigMng;
	@Autowired
	private CmsSiteMng cmsSiteMng;
}
