package com.caihong.bbs.dao;

import java.util.List;

import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.entity.BbsWebservice;

public interface BbsWebserviceDao {
	public Pagination getPage(int pageNo, int pageSize);
	
	public List<BbsWebservice> getList(String type);

	public BbsWebservice findById(Integer id);

	public BbsWebservice save(BbsWebservice bean);

	public BbsWebservice updateByUpdater(Updater<BbsWebservice> updater);

	public BbsWebservice deleteById(Integer id);
}