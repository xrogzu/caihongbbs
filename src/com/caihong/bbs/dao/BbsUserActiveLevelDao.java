package com.caihong.bbs.dao;

import java.util.List;

import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.entity.BbsUserActiveLevel;

public interface BbsUserActiveLevelDao {
	public Pagination getPage(int pageNo, int pageSize);
	
	public List<BbsUserActiveLevel> getList(Integer count);

	public BbsUserActiveLevel findById(Integer id);

	public BbsUserActiveLevel save(BbsUserActiveLevel bean);

	public BbsUserActiveLevel updateByUpdater(Updater<BbsUserActiveLevel> updater);

	public BbsUserActiveLevel deleteById(Integer id);
}