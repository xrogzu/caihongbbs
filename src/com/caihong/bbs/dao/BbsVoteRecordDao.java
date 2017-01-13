package com.caihong.bbs.dao;

import com.caihong.bbs.entity.BbsVoteRecord;




public interface BbsVoteRecordDao {
	public BbsVoteRecord findRecord(Integer userId, Integer topicId);
	
	public BbsVoteRecord save(BbsVoteRecord bean);
}
