package com.caihong.bbs.manager;

import com.caihong.bbs.entity.BbsConfig;
import com.caihong.core.entity.BbsConfigAttr;

public interface BbsConfigMng {
	public BbsConfig findById(Integer id);
	
	public BbsConfig get();

	public BbsConfig updateConfigForDay(Integer siteId);

	public BbsConfig update(BbsConfig bean);
	
}