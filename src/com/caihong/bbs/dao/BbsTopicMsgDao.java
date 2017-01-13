package com.caihong.bbs.dao;

import java.util.List;

import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.entity.BbsTopicMsg;

public interface BbsTopicMsgDao {
	public Pagination getPage(int pageNo, int pageSize);

	public BbsTopicMsg findById(Integer id);

	public BbsTopicMsg save(BbsTopicMsg bean);

	public BbsTopicMsg updateByUpdater(Updater<BbsTopicMsg> updater);

	public BbsTopicMsg deleteById(Integer id);
	
	public List<BbsTopicMsg> getTopicList(Integer userId,Integer count) ;
}