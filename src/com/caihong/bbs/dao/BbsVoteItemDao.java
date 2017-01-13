package com.caihong.bbs.dao;

import java.util.List;

import com.caihong.bbs.entity.BbsVoteItem;
import com.caihong.common.hibernate3.Updater;


public interface BbsVoteItemDao {
	public BbsVoteItem findById(Integer id);
	
	public List<BbsVoteItem> findByTopic(Integer topicId);
	
	public BbsVoteItem save(BbsVoteItem bean);
	
	public BbsVoteItem updateByUpdater(Updater<BbsVoteItem> updater);
}
