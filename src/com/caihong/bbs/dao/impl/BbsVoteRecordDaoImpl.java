package com.caihong.bbs.dao.impl;


import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.caihong.bbs.dao.BbsVoteRecordDao;
import com.caihong.bbs.entity.BbsVoteRecord;
import com.caihong.common.hibernate3.HibernateBaseDao;

@Repository
public class BbsVoteRecordDaoImpl extends HibernateBaseDao<BbsVoteRecord, Integer> implements
		BbsVoteRecordDao {
	public BbsVoteRecord findRecord(Integer userId, Integer topicId){
		String hql = "from BbsVoteRecord bean where bean.user.id=:userId and bean.topic.id=:topicId";
		Query query = getSession().createQuery(hql);
		query.setParameter("userId", userId);
		query.setParameter("topicId", topicId);
		query.setMaxResults(1);
		return (BbsVoteRecord) query.uniqueResult();
	}

	public BbsVoteRecord save(BbsVoteRecord bean) {
		getSession().save(bean);
		return bean;
	}

	protected Class<BbsVoteRecord> getEntityClass() {
		return BbsVoteRecord.class;
	}

}
