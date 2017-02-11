package com.caihong.bbs.manager;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import com.caihong.bbs.entity.BbsUser;
import com.caihong.bbs.entity.BbsUserExt;
import com.caihong.common.email.EmailSender;
import com.caihong.common.email.MessageTemplate;
import com.caihong.common.page.Pagination;

public interface BbsUserMng {
	public List<BbsUser> getList(String username, Integer count);
	
	public Pagination getPage(String username, String email, Integer groupId,
			Boolean disabled, Boolean admin,Boolean official,Integer lastLoginDay,Integer orderBy, int pageNo, int pageSize);
	
	public List<BbsUser> getAdminList(Integer siteId, Boolean allChannel,
			Boolean disabled, Integer rank);

	public BbsUser findById(Integer id);

	public BbsUser findByUsername(String username);
	
	public BbsUser registerMember(String username, String email,String telphone,Boolean official,
			String password, String ip, Integer groupId, BbsUserExt userExt,Map<String,String>attr,Integer prestige) throws UnsupportedEncodingException, MessagingException;
	
	public BbsUser registerMember(String username, String email,String telphone,
			String password, String ip, Integer groupId, BbsUserExt userExt,Map<String,String>attr, Boolean activation , EmailSender sender, MessageTemplate msgTpl) throws UnsupportedEncodingException, MessagingException ;

	public void updateLoginInfo(Integer userId, String ip,Date loginTime,String sessionId);

	public void updateUploadSize(Integer userId, Integer size);

	public void updatePwdEmail(Integer id, String password, String email,String telphone);
	
	public void updateGroup(Integer id, Integer groupId);

	public boolean isPasswordValid(Integer id, String password);

	public BbsUser saveAdmin(String username, String email,String telphone, String password,
			String ip, boolean viewOnly, boolean selfAdmin, int rank,
			Integer groupId, Integer[] roleIds, Integer[] channelIds,
			Integer[] siteIds, Byte[] steps, Boolean[] allChannels,
			BbsUserExt userExt) throws UnsupportedEncodingException, MessagingException;

	public BbsUser updateAdmin(BbsUser bean, BbsUserExt ext, String password,
			Integer groupId, Integer[] roleIds, Integer[] channelIds,
			Integer[] siteIds, Byte[] steps, Boolean[] allChannels);

	public BbsUser updateMember(Integer id, String email, String telphone,String password,
			Boolean isDisabled, String signed, String avatar, BbsUserExt ext,Map<String,String>attr,
			Integer groupId);
	
	public BbsUser updateMember(Integer id, String email,String telphone, String password,String realname,Boolean gender,String tel,Integer groupId);

	public List<BbsUser> getList(Integer count);
	public BbsUser deleteById(Integer id);

	public BbsUser[] deleteByIds(Integer[] ids);

	public boolean usernameNotExist(String username);

	public boolean emailNotExist(String email);
	
	public List<BbsUser> getSuggestMember(String username, Integer count);
	
	public void updateActiveLevel();
	
	public BbsUser updatePrestigeCnt(String username,Integer prestige,boolean isws);
	
	public void updatePoint(Integer userId,Integer point,  Integer prestige,String mid,int num,int operator);
	
}