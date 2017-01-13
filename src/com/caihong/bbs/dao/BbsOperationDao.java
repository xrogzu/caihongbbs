package com.caihong.bbs.dao;

import com.caihong.bbs.entity.BbsOperation;
import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;

public interface BbsOperationDao {

	public Pagination getPage(int pageNo, int pageSize);

	public BbsOperation findById(Integer id);

	public BbsOperation save(BbsOperation bean);

	public BbsOperation updateByUpdater(Updater<BbsOperation> updater);

	public BbsOperation deleteById(Integer id);

}