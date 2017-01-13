package com.caihong.bbs.dao;

import java.util.List;

import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.entity.BbsLimit;

public interface BbsLimitDao {
	public Pagination getPage(int pageNo, int pageSize);

	public BbsLimit findById(Integer id);
	
	public List<BbsLimit> getList(String ip,Integer userId);

	public BbsLimit save(BbsLimit bean);

	public BbsLimit updateByUpdater(Updater<BbsLimit> updater);

	public BbsLimit deleteById(Integer id);
}