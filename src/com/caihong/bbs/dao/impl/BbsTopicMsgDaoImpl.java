package com.caihong.bbs.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.caihong.common.hibernate3.Finder;
import com.caihong.common.hibernate3.HibernateBaseDao;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.dao.BbsTopicMsgDao;
import com.caihong.bbs.entity.BbsTopicMsg;

@Repository
public class BbsTopicMsgDaoImpl extends HibernateBaseDao<BbsTopicMsg, Integer> implements BbsTopicMsgDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}

	public BbsTopicMsg findById(Integer id) {
		BbsTopicMsg entity = get(id);
		return entity;
	}

	public BbsTopicMsg save(BbsTopicMsg bean) {
		getSession().save(bean);
		return bean;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<BbsTopicMsg> getTopicList(Integer userId,Integer count) {
		Finder f = Finder.create("select bean from BbsTopicMsg bean where bean.status=false");
		if(userId!=null){
			f.append(" and bean.user.id=:userId");
			f.setParam("userId", userId);
		}
		f.append(" order by bean.id desc");
		if(count!=null){
			f.setMaxResults(count);
		}
		return find(f);
	}
	
	
	
	

	public BbsTopicMsg deleteById(Integer id) {
		BbsTopicMsg entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<BbsTopicMsg> getEntityClass() {
		return BbsTopicMsg.class;
	}
}