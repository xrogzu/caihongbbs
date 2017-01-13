package com.caihong.common.email;

/**
 * 邮件发送者
 * 
 * @author tom
 * 
 */
public interface EmailSender {
	/**
	 * 发送服务器IP
	 * 
	 * @return
	 */
	public String getHost();

	/**
	 * 发送编码
	 * 
	 * @return
	 */
	public String getEncoding();
	
	public Integer getPort();

	/**
	 * 登录名
	 * 
	 * @return
	 */
	public String getUsername();

	/**
	 * 密码
	 * 
	 * @return
	 */
	public String getPassword();

	/**
	 * 发送人
	 * 
	 * @return
	 */
	public String getPersonal();
}
