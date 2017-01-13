package com.caihong.bbs.manager;

import com.caihong.bbs.entity.BbsUser;
import com.caihong.bbs.entity.BbsUserExt;

public interface BbsUserExtMng {
	public BbsUserExt save(BbsUserExt ext, BbsUser user);

	public BbsUserExt update(BbsUserExt ext, BbsUser user);
}