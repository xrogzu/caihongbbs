package com.caihong.bbs.dao.impl;

import static com.caihong.bbs.entity.BbsFriendShip.ACCEPT;
import static com.caihong.bbs.entity.BbsFriendShip.APPLYING;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.caihong.bbs.dao.BbsFriendShipDao;
import com.caihong.bbs.entity.BbsFriendShip;
import com.caihong.common.hibernate3.Finder;
import com.caihong.common.hibernate3.HibernateBaseDao;
import com.caihong.common.page.Pagination;

@Repository
public class BbsFriendShipDaoImpl extends
		HibernateBaseDao<BbsFriendShip, Integer> implements BbsFriendShipDao {
	public BbsFriendShip findById(Integer id) {
		BbsFriendShip entity = get(id);
		return entity;
	}

	public BbsFriendShip save(BbsFriendShip bean) {
		getSession().save(bean);
		return bean;
	}

	public BbsFriendShip deleteById(Integer id) {
		BbsFriendShip entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}
	
	public BbsFriendShip getFriendShip(Integer userId, Integer friendId) {
		String hql = "from BbsFriendShip bean where bean.user.id=:userId and bean.friend.id=:friendId";
		Finder f = Finder.create(hql).setParam("userId", userId).setParam("friendId", friendId);
		f.setMaxResults(1);
		Query query = f.createQuery(getSession());
		return (BbsFriendShip) query.uniqueResult();
	}
	
	public List<BbsFriendShip> getListByUserId(Integer userId) {
		String hql = "from BbsFriendShip bean where bean.user.id=:userId and bean.status="+ACCEPT;
		Finder f = Finder.create(hql).setParam("userId", userId);
		return find(f);
	}
	
	public Pagination getPageByUserId(Integer userId, Integer pageNo, Integer pageSize) {
		String hql = "from BbsFriendShip bean where bean.user.id=:userId and bean.status="+ACCEPT;
		Finder f = Finder.create(hql).setParam("userId", userId);
		return find(f, pageNo, pageSize);
	}
	
	public Pagination getApplyByUserId(Integer userId, Integer pageNo, Integer pageSize) {
		String hql = "from BbsFriendShip bean where bean.friend.id=:userId and bean.status="+APPLYING;
		Finder f = Finder.create(hql).setParam("userId", userId);
		return find(f, pageNo, pageSize);
	}

	
	public List<BbsFriendShip> getList(Integer userId) {
		String hql = "from BbsFriendShip bean where bean.friend.id=:userId and bean.status="+APPLYING;
		Finder f = Finder.create(hql).setParam("userId", userId);
		return find(f);
	}

	
	
	@Override
	protected Class<BbsFriendShip> getEntityClass() {
		return BbsFriendShip.class;
	}
}