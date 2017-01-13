package com.caihong.bbs.dao;

import com.caihong.bbs.entity.BbsCreditExchange;
import com.caihong.common.hibernate3.Updater;

public interface BbsCreditExchangeDao {
	
	public BbsCreditExchange findById(Integer id);

	public BbsCreditExchange save(BbsCreditExchange bean);

	public BbsCreditExchange updateByUpdater(Updater<BbsCreditExchange> updater);

	public BbsCreditExchange deleteById(Integer id);
}