package com.caihong.bbs.dao.impl;

import org.springframework.stereotype.Repository;

import com.caihong.bbs.dao.BbsMagicConfigDao;
import com.caihong.bbs.entity.BbsMagicConfig;
import com.caihong.common.hibernate3.HibernateBaseDao;

@Repository
public class BbsMagicConfigDaoImpl extends
		HibernateBaseDao<BbsMagicConfig, Integer> implements BbsMagicConfigDao {

	public BbsMagicConfig findById(Integer id) {
		BbsMagicConfig entity = get(id);
		return entity;
	}

	public BbsMagicConfig save(BbsMagicConfig bean) {
		getSession().save(bean);
		return bean;
	}

	public BbsMagicConfig deleteById(Integer id) {
		BbsMagicConfig entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}

	@Override
	protected Class<BbsMagicConfig> getEntityClass() {
		return BbsMagicConfig.class;
	}
}