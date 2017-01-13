package com.caihong.bbs.entity;

import com.caihong.bbs.entity.base.BaseBbsWebserviceAuth;



public class BbsWebserviceAuth extends BaseBbsWebserviceAuth {
	private static final long serialVersionUID = 1L;
	
	public Boolean getEnable(){
		return super.isEnable();
	}

/*[CONSTRUCTOR MARKER BEGIN]*/
	public BbsWebserviceAuth () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public BbsWebserviceAuth (java.lang.Integer id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public BbsWebserviceAuth (
		java.lang.Integer id,
		java.lang.String username,
		java.lang.String password,
		java.lang.String system,
		boolean enable) {

		super (
			id,
			username,
			password,
			system,
			enable);
	}

/*[CONSTRUCTOR MARKER END]*/


}