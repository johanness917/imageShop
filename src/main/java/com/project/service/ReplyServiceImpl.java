package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Reply;
import com.project.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper mapper;

	@Override
	public void register(Reply reply) throws Exception {
		mapper.create(reply);
	}

	@Override
	public List<Reply> list(Integer boardNo) throws Exception {
		return mapper.list(boardNo);
	}

	@Override
	public void remove(Integer replyNo) throws Exception {
		mapper.delete(replyNo);
	}

	@Override
	public void modify(Reply reply) throws Exception {
		mapper.modify(reply);
		
	}
}