package com.project.service;

import java.util.List;

import com.project.domain.Reply;

public interface ReplyService {
	public void register(Reply reply) throws Exception;

	public List<Reply> list(Integer boardNo) throws Exception;

	public void remove(Integer replyNo) throws Exception;

	public void modify(Reply reply) throws Exception;
}