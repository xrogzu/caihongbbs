package com.caihong.bbs.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.caihong.common.hibernate3.Finder;
import com.caihong.common.hibernate3.HibernateBaseDao;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.dao.BbsWebserviceAuthDao;
import com.caihong.bbs.entity.BbsWebserviceAuth;

@Repository
public class BbsWebserviceAuthDaoImpl extends HibernateBaseDao<BbsWebserviceAuth, Integer> implements BbsWebserviceAuthDao {
	public Pagination getPage(int pageNo, int pageSize) {
		Criteria crit = createCriteria();
		Pagination page = findByCriteria(crit, pageNo, pageSize);
		return page;
	}
	
	public BbsWebserviceAuth findByUsername(String username){
		String hql="from BbsWebserviceAuth bean where bean.username=:username";
		Finder f=Finder.create(hql).setParam("username", username);
		f.setCacheable(true);
		List<BbsWebserviceAuth>list=find(f);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	public BbsWebserviceAuth findById(Integer id) {
		BbsWebserviceAuth entity = get(id);
		return entity;
	}

	public BbsWebserviceAuth save(BbsWebserviceAuth bean) {
		getSession().save(bean);
		return bean;
	}

	public BbsWebserviceAuth deleteById(Integer id) {
		BbsWebserviceAuth entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	@Override
	protected Class<BbsWebserviceAuth> getEntityClass() {
		return BbsWebserviceAuth.class;
	}
}