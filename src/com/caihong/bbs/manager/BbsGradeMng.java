package com.caihong.bbs.manager;

import com.caihong.bbs.entity.BbsGrade;
import com.caihong.bbs.entity.BbsPost;
import com.caihong.bbs.entity.BbsUser;
import com.caihong.common.page.Pagination;

public interface BbsGradeMng {
	public BbsGrade saveGrade(BbsGrade entity, BbsUser bbsuser, BbsPost post);

	public Pagination getPage(int pageNo, int pageSize);

	public BbsGrade findById(Integer id);

	public BbsGrade save(BbsGrade bean);

	public BbsGrade update(BbsGrade bean);

	public BbsGrade deleteById(Integer id);

	public BbsGrade[] deleteByIds(Integer[] ids);
}