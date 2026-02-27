package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.common.domain.PageRequest;
import com.project.domain.Board;
import com.project.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;

	@Transactional
	@Override
	public int register(Board board) throws Exception {
		return mapper.register(board);
	}

	// 게시글 목록 (페이징 적용 버전으로 통합)
	@Override
	public List<Board> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	@Override
	public Board read(Board board) throws Exception {
		return mapper.read(board);
	}

	@Transactional
	@Override
	public int modify(Board board) throws Exception {
		return mapper.modify(board);
	}

	@Transactional
	@Override
	public int remove(Board board) throws Exception {
		return mapper.remove(board);
	}

	// 게시글 전체 건수 반환
	@Override
	public int count(PageRequest pageRequest) throws Exception {
		return mapper.count(pageRequest);
	}

}