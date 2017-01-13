package com.caihong.bbs.dao;

import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.entity.BbsWebserviceAuth;

public interface BbsWebserviceAuthDao {
	public Pagination getPage(int pageNo, int pageSize);
	
	public BbsWebserviceAuth findByUsername(String username);

	public BbsWebserviceAuth findById(Integer id);

	public BbsWebserviceAuth save(BbsWebserviceAuth bean);

	public BbsWebserviceAuth updateByUpdater(Updater<BbsWebserviceAuth> updater);

	public BbsWebserviceAuth deleteById(Integer id);
}