package com.caihong.bbs.manager;

import java.util.List;

import com.caihong.bbs.entity.BbsSession;
import com.caihong.bbs.entity.BbsUser;
import com.caihong.bbs.entity.BbsUserOnline;
import com.caihong.common.page.Pagination;
import com.caihong.core.entity.CmsConfig;

public interface BbsUserOnlineMng {

	public List<BbsUserOnline> getList();

	public Pagination getPage(int pageNo, int pageSize);

	public BbsUserOnline findById(Integer id);

	public BbsUserOnline save(BbsUserOnline bean);
	
	public BbsUserOnline saveByUser(BbsUser user);

	public BbsUserOnline update(BbsUserOnline bean);
	
	public void clearCount(CmsConfig config);
	
	public void updateUserOnlineTime(BbsSession userSession);

	public BbsUserOnline deleteById(Integer id);

	public BbsUserOnline[] deleteByIds(Integer[] ids);
}