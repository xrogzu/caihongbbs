package com.caihong.bbs.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.caihong.bbs.dao.BbsMessageReplyDao;
import com.caihong.bbs.entity.BbsMessageReply;
import com.caihong.common.hibernate3.Finder;
import com.caihong.common.hibernate3.HibernateBaseDao;
import com.caihong.common.page.Pagination;

@Repository
public class BbsMessageReplyDaoImpl extends
		HibernateBaseDao<BbsMessageReply, Integer> implements BbsMessageReplyDao {
	public BbsMessageReply findById(Integer id) {
		BbsMessageReply entity = get(id);
		return entity;
	}

	public BbsMessageReply save(BbsMessageReply bean) {
		getSession().save(bean);
		return bean;
	}

	public BbsMessageReply deleteById(Integer id) {
		BbsMessageReply entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	public Pagination getPageByMsgId(Integer msgId, Integer pageNo,
			Integer pageSize) {
		String hql = "from BbsMessageReply bean where bean.message.id=:msgId order by bean.createTime desc";
		Finder f = Finder.create(hql).setParam("msgId", msgId);
		return find(f, pageNo, pageSize);
	}
	
	public Pagination getPage(Integer pageNo, Integer pageSize){
		String hql = "select max(bean.id) from BbsMessageReply bean group by bean.sender,bean.createTime order by bean.createTime desc";
		String pageHql="select bean.createTime from BbsMessageReply bean group by bean.sender,bean.createTime order by bean.createTime desc";
		Finder f = Finder.create(hql,pageHql);
		f.setCacheable(true);
		Pagination ids= find(f,pageNo,pageSize);
		Integer totalCount=ids.getTotalCount();
		Pagination p = new Pagination(pageNo, pageSize, totalCount);
		if (totalCount < 1) {
			p.setList(new ArrayList());
			return p;
		}else{
			List<BbsMessageReply>replys=new ArrayList<BbsMessageReply>();
			for(Object id:ids.getList()){
				replys.add(findById(Integer.parseInt(id.toString())));
			}
			p.setList(replys);
		}
		return p;
	}
	
	public List<BbsMessageReply> getList(Integer msgId,int count){
		String hql = "from BbsMessageReply bean where bean.message.id=:msgId order by bean.createTime desc";
		Finder f = Finder.create(hql).setParam("msgId", msgId);
		f.setMaxResults(count);
		return find(f);
	}
	
	public List<BbsMessageReply> getList(String username){
		String hql = "from BbsMessageReply bean where bean.receiver.username=:username and bean.status=false and bean.isnotification=false order by bean.createTime desc";
		Finder f = Finder.create(hql).setParam("username", username);
		return find(f);
	}
	
	public int countByReceiver(String username) {
		String hql = "select count(*) from BbsMessageReply bean where bean.receiver.username=:username and bean.status=false";
		Query query = getSession().createQuery(hql);
		query.setParameter("username", username);
		return ((Number) query.iterate().next()).intValue();
	}

	@Override
	protected Class<BbsMessageReply> getEntityClass() {
		return BbsMessageReply.class;
	}
}