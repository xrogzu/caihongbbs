package com.caihong.bbs.entity;

import com.caihong.bbs.entity.base.BaseBbsWebserviceCallRecord;



public class BbsWebserviceCallRecord extends BaseBbsWebserviceCallRecord {
	private static final long serialVersionUID = 1L;

/*[CONSTRUCTOR MARKER BEGIN]*/
	public BbsWebserviceCallRecord () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public BbsWebserviceCallRecord (java.lang.Integer id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public BbsWebserviceCallRecord (
		java.lang.Integer id,
		com.caihong.bbs.entity.BbsWebserviceAuth auth,
		java.lang.String serviceCode,
		java.util.Date recordTime) {

		super (
			id,
			auth,
			serviceCode,
			recordTime);
	}

/*[CONSTRUCTOR MARKER END]*/


}