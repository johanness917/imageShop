package com.project.mapper;

import java.util.List;
import com.project.domain.Reply;

public interface ReplyMapper {
	public int create(Reply reply) throws Exception;

	public List<Reply> list(Integer boardNo) throws Exception;

	public int delete(Integer replyNo) throws Exception;

	public void modify(Reply reply) throws Exception;
}