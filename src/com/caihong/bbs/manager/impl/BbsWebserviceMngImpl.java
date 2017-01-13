package com.caihong.bbs.manager.impl;

import java.util.List;
import java.util.Map;

import javax.xml.namespace.QName;

import org.apache.axis.client.Call;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.dao.BbsWebserviceDao;
import com.caihong.bbs.entity.BbsWebservice;
import com.caihong.bbs.entity.BbsWebserviceParam;
import com.caihong.bbs.manager.BbsWebserviceMng;

@Service
@Transactional
public class BbsWebserviceMngImpl implements BbsWebserviceMng {
	@Transactional(readOnly = true)
	public Pagination getPage(int pageNo, int pageSize) {
		Pagination page = dao.getPage(pageNo, pageSize);
		return page;
	}
	
	@Transactional(readOnly = true)
	public List<BbsWebservice> getList(String type){
		return dao.getList(type);
	}
	
	@Transactional(readOnly = true)
	public boolean hasWebservice(String type){
		if(getList(type).size()>0){
			return true;
		}else{
			return false;
		}
	}

	@Transactional(readOnly = true)
	public BbsWebservice findById(Integer id) {
		BbsWebservice entity = dao.findById(id);
		return entity;
	}
	
	public void callWebService(String operate,Map<String,String>params){
		List<BbsWebservice>list=getList(operate);
		for(BbsWebservice s:list){
			callWebService(s, params);
		}
	}
	
	public String callWebService(BbsWebservice webservice,Map<String,String>paramsValues){
		String endpoint =webservice.getAddress();
		org.apache.axis.client.Service service = new org.apache.axis.client.Service(); 
		Call call;
		String res=null;
		try {
			call = (Call) service.createCall();
			call.setTargetEndpointAddress(endpoint); // 为Call设置服务的位置
			call.setOperationName(new QName(webservice.getTargetNamespace(), webservice.getOperate()));
			List<BbsWebserviceParam>params=webservice.getParams();
			Object[]values=new Object[params.size()];
			for(int i=0;i<params.size();i++){
				BbsWebserviceParam p=params.get(i);
				String defaultValue=p.getDefaultValue();
				String pValue=paramsValues.get(p.getParamName());
				if(StringUtils.isBlank(pValue)){
					values[i]=defaultValue;
				}else{
					values[i]=pValue;
				}
			}
			res= (String) call.invoke(values);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return res;
	}

	public BbsWebservice save(BbsWebservice bean,String[] paramName, String[] defaultValue) {
		bean=dao.save(bean);
		// 保存参数
		if (paramName != null && paramName.length > 0) {
			for (int i = 0, len = paramName.length; i < len; i++) {
				if (!StringUtils.isBlank(paramName[i])) {
					bean.addToParams(paramName[i], defaultValue[i]);
				}
			}
		}
		return bean;
	}

	public BbsWebservice update(BbsWebservice bean,String[] paramName, String[] defaultValue) {
		Updater<BbsWebservice> updater = new Updater<BbsWebservice>(bean);
		BbsWebservice entity = dao.updateByUpdater(updater);
		entity.getParams().clear();
		if (paramName != null && paramName.length > 0) {
			for (int i = 0, len = paramName.length; i < len; i++) {
				if (!StringUtils.isBlank(paramName[i])) {
					entity.addToParams(paramName[i], defaultValue[i]);
				}
			}
		}
		return entity;
	}

	public BbsWebservice deleteById(Integer id) {
		BbsWebservice bean = dao.deleteById(id);
		return bean;
	}
	
	public BbsWebservice[] deleteByIds(Integer[] ids) {
		BbsWebservice[] beans = new BbsWebservice[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private BbsWebserviceDao dao;

	@Autowired
	public void setDao(BbsWebserviceDao dao) {
		this.dao = dao;
	}
}