package com.caihong.bbs.entity;

import java.util.ArrayList;
import java.util.List;

import com.caihong.bbs.entity.base.BaseBbsWebservice;


public class BbsWebservice extends BaseBbsWebservice {
	private static final long serialVersionUID = 1L;
	public static final String SERVICE_TYPE_ADD_USER = "addUser";
	public static final String SERVICE_TYPE_UPDATE_USER = "updateUser";
	public static final String SERVICE_TYPE_DELETE_USER = "deleteUser";
	
	public void addToParams(String name, String defaultValue) {
		List<BbsWebserviceParam> list = getParams();
		if (list == null) {
			list = new ArrayList<BbsWebserviceParam>();
			setParams(list);
		}
		BbsWebserviceParam param = new BbsWebserviceParam();
		param.setParamName(name);
		param.setDefaultValue(defaultValue);
		list.add(param);
	}

/*[CONSTRUCTOR MARKER BEGIN]*/
	public BbsWebservice () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public BbsWebservice (java.lang.Integer id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public BbsWebservice (
		java.lang.Integer id,
		java.lang.String address) {

		super (
			id,
			address);
	}

/*[CONSTRUCTOR MARKER END]*/


}