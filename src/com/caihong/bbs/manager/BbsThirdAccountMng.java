package com.caihong.bbs.manager;

import com.caihong.common.page.Pagination;
import com.caihong.bbs.entity.BbsThirdAccount;

public interface BbsThirdAccountMng {
	public Pagination getPage(String username,String source,int pageNo, int pageSize);

	public BbsThirdAccount findById(Long id);
	
	public BbsThirdAccount findByKey(String key);

	public BbsThirdAccount save(BbsThirdAccount bean);

	public BbsThirdAccount update(BbsThirdAccount bean);

	public BbsThirdAccount deleteById(Long id);
	
	public BbsThirdAccount[] deleteByIds(Long[] ids);
}