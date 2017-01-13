package com.caihong.bbs.dao;

import com.caihong.bbs.entity.BbsMemberMagic;
import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;

public interface BbsMemberMagicDao {

	public Pagination getPage(Integer userId, int pageNo, int pageSize);

	public BbsMemberMagic findById(Integer id);

	public BbsMemberMagic save(BbsMemberMagic bean);

	public BbsMemberMagic updateByUpdater(Updater<BbsMemberMagic> bean);

	public BbsMemberMagic deleteById(Integer id);

}