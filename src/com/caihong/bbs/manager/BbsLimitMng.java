package com.caihong.bbs.manager;

import com.caihong.common.page.Pagination;
import com.caihong.bbs.entity.BbsLimit;

public interface BbsLimitMng {
	public Pagination getPage(int pageNo, int pageSize);

	public BbsLimit findById(Integer id);
	
	public boolean ipIsLimit(String ip);
	
	public boolean userIsLimit(Integer userId);

	public BbsLimit save(BbsLimit bean);

	public BbsLimit update(BbsLimit bean);

	public BbsLimit deleteById(Integer id);
	
	public BbsLimit[] deleteByIds(Integer[] ids);
}