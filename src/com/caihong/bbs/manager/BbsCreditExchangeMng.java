package com.caihong.bbs.manager;

import com.caihong.bbs.entity.BbsCreditExchange;

public interface BbsCreditExchangeMng {
	public BbsCreditExchange findById(Integer id);

	public BbsCreditExchange update(BbsCreditExchange bean);
}