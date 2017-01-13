package com.caihong.bbs.dao;

import com.caihong.bbs.entity.BbsUserExt;
import com.caihong.common.hibernate3.Updater;

public interface BbsUserExtDao {
	public BbsUserExt findById(Integer id);

	public BbsUserExt save(BbsUserExt bean);

	public BbsUserExt updateByUpdater(Updater<BbsUserExt> updater);
}