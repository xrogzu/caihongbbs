package com.caihong.bbs.dao;

import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.entity.BbsWebserviceCallRecord;

public interface BbsWebserviceCallRecordDao {
	public Pagination getPage(int pageNo, int pageSize);

	public BbsWebserviceCallRecord findById(Integer id);

	public BbsWebserviceCallRecord save(BbsWebserviceCallRecord bean);

	public BbsWebserviceCallRecord updateByUpdater(Updater<BbsWebserviceCallRecord> updater);

	public BbsWebserviceCallRecord deleteById(Integer id);
}