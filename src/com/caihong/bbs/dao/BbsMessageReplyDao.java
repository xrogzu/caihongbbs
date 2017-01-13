package com.caihong.bbs.dao;


import java.util.List;

import com.caihong.bbs.entity.BbsMessageReply;
import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;

public interface BbsMessageReplyDao {
	public BbsMessageReply findById(Integer id);

	public BbsMessageReply save(BbsMessageReply bean);

	public BbsMessageReply updateByUpdater(Updater<BbsMessageReply> updater);

	public BbsMessageReply deleteById(Integer id);

	public Pagination getPageByMsgId(Integer msgId, Integer pageNo,
			Integer pageSize);
	
	public Pagination getPage(Integer pageNo, Integer pageSize);
	
	public List<BbsMessageReply> getList(Integer msgId,int count);
	
	public int countByReceiver(String username);
	
	public List<BbsMessageReply> getList(String username);
}