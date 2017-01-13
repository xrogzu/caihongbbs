package com.caihong.bbs.entity;

/**
 * 
 * 投票贴
 * 
 */
public class BbsVoteTopicSingle extends BbsVoteTopic {
	/**
	 * 总票数
	 */
	private Integer totalCount;

	public void init() {
		super.init();
		if (totalCount == null) {
			totalCount = 0;
		}
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public short getCategory() {
		return TOPIC_VOTE_SINGLE;
	}
}