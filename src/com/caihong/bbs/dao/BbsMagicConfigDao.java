package com.caihong.bbs.dao;

import com.caihong.bbs.entity.BbsMagicConfig;
import com.caihong.common.hibernate3.Updater;

public interface BbsMagicConfigDao {
	
	public BbsMagicConfig findById(Integer id);

	public BbsMagicConfig save(BbsMagicConfig bean);

	public BbsMagicConfig updateByUpdater(Updater<BbsMagicConfig> updater);

	public BbsMagicConfig deleteById(Integer id);
}