package com.caihong.bbs.manager;

import java.util.List;

import com.caihong.bbs.entity.BbsUser;
import com.caihong.bbs.entity.BbsVoteItem;
import com.caihong.bbs.entity.BbsVoteTopic;


public interface BbsVoteItemMng {
	public BbsVoteItem findById(Integer id);
	
	public List<BbsVoteItem> findByTopic(Integer topicId);
	
	public BbsVoteItem save(BbsVoteItem bean);
	
	public BbsVoteItem update(BbsVoteItem bean);

	public void vote(BbsUser user, BbsVoteTopic topic, Integer[] itemIds);
}
