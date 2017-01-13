package com.caihong.bbs.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.caihong.bbs.dao.BbsVoteItemDao;
import com.caihong.bbs.entity.BbsVoteItem;
import com.caihong.common.hibernate3.Finder;
import com.caihong.common.hibernate3.HibernateBaseDao;

@Repository
public class BbsVoteItemDaoImpl extends HibernateBaseDao<BbsVoteItem, Integer> implements
		BbsVoteItemDao {
	public BbsVoteItem findById(Integer id){
		BbsVoteItem entity = get(id);
		return entity;
	}
	
	@SuppressWarnings("unchecked")
	public List<BbsVoteItem> findByTopic(Integer topicId) {
		String hql = "from BbsVoteItem bean where bean.topic.id=:topicId";
		Finder f = Finder.create(hql);
		f.setParam("topicId", topicId);
		return find(f);
	}

	public BbsVoteItem save(BbsVoteItem bean) {
		getSession().save(bean);
		return bean;
	}

	protected Class<BbsVoteItem> getEntityClass() {
		return BbsVoteItem.class;
	}

}
