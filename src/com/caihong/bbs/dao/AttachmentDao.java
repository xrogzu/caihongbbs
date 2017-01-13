package com.caihong.bbs.dao;

import com.caihong.common.hibernate3.Updater;
import com.caihong.common.page.Pagination;
import com.caihong.bbs.entity.Attachment;

public interface AttachmentDao {
	public Pagination getPage(int pageNo, int pageSize);

	public Attachment findById(Integer id);

	public Attachment save(Attachment bean);

	public Attachment updateByUpdater(Updater<Attachment> updater);

	public Attachment deleteById(Integer id);
}