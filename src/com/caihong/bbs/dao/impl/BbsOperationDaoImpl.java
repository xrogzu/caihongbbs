﻿package com.caihong.bbs.dao.impl;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.caihong.bbs.entity.BbsOperation;
import com.caihong.bbs.dao.BbsOperationDao;
import com.caihong.common.hibernate3.HibernateBaseDao;
import com.caihong.common.page.Pagination;

@Repository
public class BbsOperationDaoImpl extends
		HibernateBaseDao<BbsOperation, Integer> implements BbsOperationDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}

	public BbsOperation findById(Integer id) {
		BbsOperation entity = get(id);
		return entity;
	}

	public BbsOperation save(BbsOperation bean) {
		getSession().save(bean);
		return bean;
	}

	public BbsOperation deleteById(Integer id) {
		BbsOperation entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}

	@Override
	protected Class<BbsOperation> getEntityClass() {
		return BbsOperation.class;
	}
}