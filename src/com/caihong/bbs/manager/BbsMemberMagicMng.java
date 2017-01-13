package com.caihong.bbs.manager;

import com.caihong.bbs.entity.BbsMemberMagic;
import com.caihong.common.page.Pagination;

public interface BbsMemberMagicMng {

	public Pagination getPage(Integer userId,int pageNo, int pageSize);

	public BbsMemberMagic findById(Integer id);

	public BbsMemberMagic save(BbsMemberMagic bean);

	public BbsMemberMagic update(BbsMemberMagic bean);

	public BbsMemberMagic deleteById(Integer id);

	public BbsMemberMagic[] deleteByIds(Integer[] ids);
}