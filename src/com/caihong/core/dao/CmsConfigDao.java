package com.caihong.core.dao;

import java.util.List;

import com.caihong.common.hibernate3.Updater;
import com.caihong.core.entity.CmsConfig;

public interface CmsConfigDao {
	public CmsConfig findById(Integer id);

	public CmsConfig updateByUpdater(Updater<CmsConfig> updater);

	public List<CmsConfig> getList();
}