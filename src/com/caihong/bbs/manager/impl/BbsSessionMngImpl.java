package com.caihong.bbs.manager.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.Ehcache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;
import com.caihong.common.util.DateFormatUtils;
import com.caihong.common.web.RequestUtils;
import com.caihong.common.web.session.SessionProvider;
import com.caihong.core.entity.BbsConfigAttr;
import com.caihong.core.entity.CmsConfig;
import com.caihong.core.manager.CmsConfigMng;
import com.caihong.bbs.cache.BbsUserCache;
import com.caihong.bbs.dao.BbsSessionDao;
import com.caihong.bbs.entity.BbsSession;
import com.caihong.bbs.entity.BbsUser;
import com.caihong.bbs.manager.BbsSessionMng;
import com.caihong.bbs.manager.BbsUserOnlineMng;
import com.caihong.bbs.web.CmsUtils;

@Service
@Transactional
public class BbsSessionMngImpl implements BbsSessionMng {
	@Transactional(readOnly = true)
	public Pagination getPage(int pageNo, int pageSize) {
		Pagination page = dao.getPage(pageNo, pageSize);
		return page;
	}
	
	@Transactional(readOnly = true)
	public List<BbsSession> getList(Integer count){
		return dao.getList(count);
	}
	
	public void freshCacheToDB(Ehcache cache){
		dao.freshCacheToDB(cache);
	}
	
	public void recordUserSession(HttpServletRequest request,HttpServletResponse response){
		BbsUser user=CmsUtils.getUser(request);
		Date now=Calendar.getInstance().getTime();
		int userOnlineKeepMinute=configMng.get().getKeepMinute();
		String userSessionId=session.getSessionId(request, response);
		BbsSession session=findBySessionId(userSessionId);
		if(session==null){
			session=new BbsSession();
			session.setIp(RequestUtils.getIpAddr(request));
			session.setSessionId(userSessionId);
			session.setUser(user);
			session.setFirstActivetime(now);
			session.setLastActivetime(now);
			save(session);
		}else{
			//还在保持时间范围内
			if(user!=null&&session.getUser()==null){
				session.setUser(user);
				update(session);
			}
			bbsUserCache.view(session.getId(),now);
		}
		processExistSessions(userOnlineKeepMinute);
	}
	
	
	private void processExistSessions(int userOnlineKeepMinute){
		long time = System.currentTimeMillis();
		if (time > processTime + interval) {
			processTime = time;
			Date now=Calendar.getInstance().getTime();
			List<BbsSession>userSessions=getList(Integer.MAX_VALUE);
			CmsConfig config=configMng.get();
			bbsUserOnlineMng.clearCount(config);
			Integer topNum=config.getUserOnlineTopNum();
			int sessionTotal=userSessions.size();
			if(sessionTotal>topNum){
				BbsConfigAttr configAttr=new BbsConfigAttr();
				configAttr.setUserOnlineTopDay(DateFormatUtils.formatDate(now));
				configAttr.setUserOnlineTopNum(String.valueOf(sessionTotal));
				configMng.updateConfigAttr(configAttr);
			}
			//更新最后活动时间
			bbsUserCache.refreshToDB();
			for(BbsSession userSession:userSessions){
				bbsUserOnlineMng.updateUserOnlineTime(userSession);
				//超出在线保持时间
				if(time-userSession.getLastActivetime().getTime()>userOnlineKeepMinute*60*1000){
					//更新在线时长数据
					deleteById(userSession.getId());
				}
			}
			bbsUserCache.removeCache();
		}
	}
	
	
	@Transactional(readOnly = true)
	public Integer total(boolean member){
		return dao.total(member);
	}

	@Transactional(readOnly = true)
	public BbsSession findById(Long id) {
		BbsSession entity = dao.findById(id);
		return entity;
	}
	
	@Transactional(readOnly = true)
	public BbsSession findBySessionId(String sessionId){
		return dao.findBySessionId(sessionId);
	}

	public BbsSession save(BbsSession bean) {
		dao.save(bean);
		return bean;
	}

	public BbsSession update(BbsSession bean) {
		Updater<BbsSession> updater = new Updater<BbsSession>(bean);
		BbsSession entity = dao.updateByUpdater(updater);
		return entity;
	}

	public BbsSession deleteById(Long id) {
		BbsSession bean = dao.deleteById(id);
		return bean;
	}
	
	public BbsSession[] deleteByIds(Long[] ids) {
		BbsSession[] beans = new BbsSession[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private BbsSessionDao dao;
	@Autowired
	private CmsConfigMng configMng;
	@Autowired
	private BbsUserOnlineMng bbsUserOnlineMng;
	@Autowired
	private BbsUserCache bbsUserCache;
	@Autowired
	private SessionProvider session;

	// 间隔时间
	private int interval = 1 * 60 * 1000*10; // 10分钟
	// 最后处理时间
	private long processTime = System.currentTimeMillis();
		
	@Autowired
	public void setDao(BbsSessionDao dao) {
		this.dao = dao;
	}
}