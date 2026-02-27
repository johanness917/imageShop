package com.project.mapper;

import java.util.List;

import com.project.common.domain.PageRequest;
import com.project.domain.Board;

public interface BoardMapper {

	public int register(Board board) throws Exception;

	// 게시글 목록 (페이징 적용)
	public List<Board> list(PageRequest pageRequest) throws Exception;

	public Board read(Board board) throws Exception;

	public int modify(Board board) throws Exception;

	public int remove(Board board) throws Exception;

	// 게시글 전체 건수 반환 (페이징 처리에 필요)
	public int count(PageRequest pageRequest) throws Exception;

}