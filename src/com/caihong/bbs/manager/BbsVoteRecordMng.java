package com.caihong.bbs.manager;


import com.caihong.bbs.entity.BbsVoteRecord;


public interface BbsVoteRecordMng {
	public BbsVoteRecord findRecord(Integer userId, Integer topicId);
	
	public BbsVoteRecord save(BbsVoteRecord bean);
}
