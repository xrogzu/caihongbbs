package com.caihong.bbs.entity;

import com.caihong.bbs.entity.base.BaseBbsReportExt;



public class BbsReportExt extends BaseBbsReportExt {
	private static final long serialVersionUID = 1L;

/*[CONSTRUCTOR MARKER BEGIN]*/
	public BbsReportExt () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public BbsReportExt (java.lang.Integer id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public BbsReportExt (
		java.lang.Integer id,
		com.caihong.bbs.entity.BbsUser reportUser,
		com.caihong.bbs.entity.BbsReport report,
		java.util.Date reportTime) {

		super (
			id,
			reportUser,
			report,
			reportTime);
	}

/*[CONSTRUCTOR MARKER END]*/


}