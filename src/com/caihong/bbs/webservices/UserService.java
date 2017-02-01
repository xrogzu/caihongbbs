/**
*	TOM
*/
package com.caihong.bbs.webservices;



import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.caihong.bbs.cache.BbsConfigEhCache;
import com.caihong.bbs.entity.BbsUser;
import com.caihong.bbs.entity.BbsUserExt;
import com.caihong.bbs.entity.BbsUserGroup;
import com.caihong.bbs.manager.BbsConfigMng;
import com.caihong.bbs.manager.BbsUserMng;
import com.caihong.bbs.manager.BbsWebserviceAuthMng;
import com.caihong.bbs.manager.BbsWebserviceCallRecordMng;


public class UserService  extends SpringBeanAutowiringSupport{
	private static final String SERVICE_CODE_USER_DELETE="user_delete";
	private static final String SERVICE_CODE_USER_ADD="user_add";
	private static final String SERVICE_CODE_USER_UPDATE="user_update";
	private static final String RESPONSE_CODE_SUCCESS="100";
	private static final String RESPONSE_CODE_AUTH_ERROR="101";
	private static final String RESPONSE_CODE_PARAM_REQUIRED="102";
	private static final String RESPONSE_CODE_USER_NOT_FOUND="103";
	private static final String RESPONSE_CODE_USER_ADD_ERROR="104";
	private static final String RESPONSE_CODE_USER_UPDATE_ERROR="105";
	private static final String RESPONSE_CODE_USER_DELETE_ERROR="106";
	private static final String LOCAL_IP="127.0.0.1";
	
	private static final Integer SITE_ID=1;
	private static final Integer GROUP_DOCTOR_ID=13; //认证医生group id
	private static final Integer CMS_GROUP_DOCTOR_ID=2; //网站认证医生group id
	
	
	public String addUser(String auth_username,String auth_password,String username,String password,String email,String realname,String sex,String tel,String telphone,String groupId) {
		String responseCode=RESPONSE_CODE_AUTH_ERROR;
		if(validate(auth_username, auth_password)){
			if(StringUtils.isBlank(username)||StringUtils.isBlank(password)){
				responseCode=RESPONSE_CODE_PARAM_REQUIRED;
			}else{
				BbsUserGroup group =null;
				Integer group_id;
				
				if(groupId!=null&&new Integer(groupId).equals(CMS_GROUP_DOCTOR_ID)){
					group_id=GROUP_DOCTOR_ID;
				}else{
					group=bbsConfigMng.get().getRegisterGroup();
					group_id=group.getId();
				}
				BbsUserExt userExt=new BbsUserExt();
				userExt.setRealname(realname);
				if(StringUtils.isNotBlank(sex)){
					if(sex.equals("true")){
						userExt.setGender(true);
					}else if(sex.equals("false")){
						userExt.setGender(false);
					}
				}
				userExt.setMoble(tel);
				try {
					BbsUser user=bbsUserMng.registerMember(username, email,telphone,false, password, LOCAL_IP, group_id, userExt, null);
					responseCode=RESPONSE_CODE_SUCCESS;
					bbsWebserviceCallRecordMng.save(auth_username, SERVICE_CODE_USER_ADD);
					bbsConfigEhCache.setBbsConfigCache(0, 0, 0, 1, user, SITE_ID);
				} catch (Exception e) {
					responseCode=RESPONSE_CODE_USER_ADD_ERROR;
				}
			}
		}
		return responseCode;
	}
	
	public String updateUser(String auth_username,String auth_password,String username,String password,String email,String realname,String sex,String tel,String telphone,String groupId) {
		String responseCode=RESPONSE_CODE_AUTH_ERROR;
		if(validate(auth_username, auth_password)){
			if(StringUtils.isBlank(username)){
				responseCode=RESPONSE_CODE_PARAM_REQUIRED;
			}else{
				BbsUser user=bbsUserMng.findByUsername(username);
				if(user!=null){
					try {
						Boolean sexBoolean=null;
						if(StringUtils.isNotBlank(sex)){
							if(sex.equals("true")){
								sexBoolean=true;
							}else if(sex.equals("false")){
								sexBoolean=false;
							}
						}
						Integer group_id=null;
						if(groupId!=null&&new Integer(groupId).equals(CMS_GROUP_DOCTOR_ID)){
							group_id=GROUP_DOCTOR_ID;
						}else{
							group_id=bbsConfigMng.get().getRegisterGroup().getId();
						}
						bbsUserMng.updateMember(user.getId(), email,telphone, password, realname, sexBoolean, tel,group_id);
						responseCode=RESPONSE_CODE_SUCCESS;
						bbsWebserviceCallRecordMng.save(auth_username, SERVICE_CODE_USER_UPDATE);
					} catch (Exception e) {
						e.printStackTrace();
						responseCode=RESPONSE_CODE_USER_UPDATE_ERROR;
					}
				}else{
					responseCode=RESPONSE_CODE_USER_NOT_FOUND;
				}
			}
		}
		return responseCode;
	}
	
	public String delUser(String auth_username,String auth_password,String username) {
		String responseCode=RESPONSE_CODE_AUTH_ERROR;
		if(validate(auth_username, auth_password)){
			if(StringUtils.isNotBlank(username)){
				BbsUser user=bbsUserMng.findByUsername(username);
				if(user!=null){
					try{
						bbsUserMng.deleteById(user.getId());
						responseCode=RESPONSE_CODE_SUCCESS;
						bbsWebserviceCallRecordMng.save(auth_username, SERVICE_CODE_USER_DELETE);
					} catch (Exception e) {
						responseCode=RESPONSE_CODE_USER_DELETE_ERROR;
					}
				}else{
					responseCode=RESPONSE_CODE_USER_NOT_FOUND;
				}
			}else{
				responseCode=RESPONSE_CODE_PARAM_REQUIRED;
			}
		}
		return responseCode;
	}
	
	private boolean validate(String username,String password){
		if(StringUtils.isBlank(username)||StringUtils.isBlank(password)){
			return false;
		}else{
			return bbsWebserviceAuthMng.isPasswordValid(username, password);
		}
	}
	
	@Autowired
	private BbsUserMng bbsUserMng;
	@Autowired
	private BbsConfigMng bbsConfigMng;
	
	@Autowired
	private BbsConfigEhCache bbsConfigEhCache;
	@Autowired
	private BbsWebserviceAuthMng bbsWebserviceAuthMng;
	@Autowired
	private BbsWebserviceCallRecordMng bbsWebserviceCallRecordMng;
}

