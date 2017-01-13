package com.caihong.bbs.dao;


import java.util.List;

import com.caihong.bbs.entity.BbsMessage;
import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;

public interface BbsMessageDao {
	public BbsMessage findById(Integer id);

	public BbsMessage save(BbsMessage bean);

	public BbsMessage updateByUpdater(Updater<BbsMessage> updater);

	public BbsMessage deleteById(Integer id);

	public BbsMessage getSendRelation(Integer userId, Integer senderId, Integer receiverId,Integer typeId);

	public Pagination getPageByUserId(Integer userId,Integer typeId, Integer pageNo,
			Integer pageSize); 
	
	public List<BbsMessage> getListByUserIdStatus(Integer userId,Integer typeId,Boolean status);
	
	public List<BbsMessage> getListByUsername(String username);
	
	public Pagination getPagination(Boolean sys,Integer pageNo,Integer pageSize);
}