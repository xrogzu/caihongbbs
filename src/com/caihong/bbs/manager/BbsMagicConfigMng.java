package com.caihong.bbs.manager;

import com.caihong.bbs.entity.BbsMagicConfig;

public interface BbsMagicConfigMng {

	public BbsMagicConfig findById(Integer id);

	public BbsMagicConfig update(BbsMagicConfig bean);

}