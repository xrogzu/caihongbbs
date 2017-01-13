package com.caihong.bbs.dao;

import com.caihong.bbs.entity.BbsReportExt;
import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;

public interface BbsReportExtDao {
	public BbsReportExt findById(Integer id);

	public BbsReportExt save(BbsReportExt bean);

	public BbsReportExt updateByUpdater(Updater<BbsReportExt> updater);

	public BbsReportExt deleteById(Integer id);

	public Pagination getPage(Integer reportId,Integer pageNo, Integer pageSize);

	public BbsReportExt findByReportUid(Integer reportId, Integer userId);
}