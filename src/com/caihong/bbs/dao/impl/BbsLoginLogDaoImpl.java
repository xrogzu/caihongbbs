package com.caihong.bbs.dao.impl;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.caihong.bbs.entity.BbsLoginLog;
import com.caihong.bbs.dao.BbsLoginLogDao;
import com.caihong.common.hibernate3.HibernateBaseDao;
import com.caihong.common.page.Pagination;

@Repository
public class BbsLoginLogDaoImpl extends HibernateBaseDao<BbsLoginLog, Integer>
		implements BbsLoginLogDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}

	public BbsLoginLog findById(Integer id) {
		BbsLoginLog entity = get(id);
		return entity;
	}

	public BbsLoginLog save(BbsLoginLog bean) {
		getSession().save(bean);
		return bean;
	}

	public BbsLoginLog deleteById(Integer id) {
		BbsLoginLog entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}

	protected Class<BbsLoginLog> getEntityClass() {
		return BbsLoginLog.class;
	}
}