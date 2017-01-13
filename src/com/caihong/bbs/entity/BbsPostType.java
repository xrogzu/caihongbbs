package com.caihong.bbs.entity;

import com.caihong.bbs.entity.base.BaseBbsPostType;



public class BbsPostType extends BaseBbsPostType {
	private static final long serialVersionUID = 1L;

/*[CONSTRUCTOR MARKER BEGIN]*/
	public BbsPostType () {
		super();
	}

	/**
	 * Constructor for primary key
	 */
	public BbsPostType (java.lang.Integer id) {
		super(id);
	}

	/**
	 * Constructor for required fields
	 */
	public BbsPostType (
		java.lang.Integer id,
		com.caihong.core.entity.CmsSite site,
		com.caihong.bbs.entity.BbsForum forum) {

		super (
			id,
			site,
			forum);
	}

/*[CONSTRUCTOR MARKER END]*/


}