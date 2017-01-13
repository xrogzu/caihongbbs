package com.caihong.bbs.dao;

import com.caihong.bbs.entity.BbsThirdAccount;
import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;

public interface BbsThirdAccountDao {
	public Pagination getPage(String username,String source,int pageNo, int pageSize);

	public BbsThirdAccount findById(Long id);
	
	public BbsThirdAccount findByKey(String key);

	public BbsThirdAccount save(BbsThirdAccount bean);

	public BbsThirdAccount updateByUpdater(Updater<BbsThirdAccount> updater);

	public BbsThirdAccount deleteById(Long id);
}