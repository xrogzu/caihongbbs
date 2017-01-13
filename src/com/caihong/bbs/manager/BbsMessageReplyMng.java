package com.caihong.bbs.manager;


import java.util.List;

import com.caihong.bbs.entity.BbsMessageReply;
import com.caihong.common.page.Pagination;


public interface BbsMessageReplyMng {
	public BbsMessageReply findById(Integer id);

	public BbsMessageReply save(BbsMessageReply bean);

	public BbsMessageReply update(BbsMessageReply bean);

	public BbsMessageReply deleteById(Integer id);

	public BbsMessageReply[] deleteByIds(Integer[] ids);

	public Pagination getPageByMsgId(Integer msgId, Integer pageNo, Integer pageSize);
	
	public Pagination getPage(Integer pageNo, Integer pageSize);
	
	public List<BbsMessageReply> getList(Integer msgId,int count);
	
	public int countByReceiver(String username);
	
	public BbsMessageReply getNewReply(String username);
}