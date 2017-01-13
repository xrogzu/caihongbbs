package com.caihong.bbs.dao;

import com.caihong.bbs.entity.BbsGrade;
import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;

public interface BbsGradeDao {
	public Pagination getPage(int pageNo, int pageSize);

	public BbsGrade findById(Integer id);

	public BbsGrade save(BbsGrade bean);

	public BbsGrade updateByUpdater(Updater<BbsGrade> updater);

	public BbsGrade deleteById(Integer id);
}