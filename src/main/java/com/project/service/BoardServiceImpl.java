package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

<<<<<<< HEAD
=======
import com.project.common.domain.PageRequest;
>>>>>>> master
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

	@Override
<<<<<<< HEAD
	public List<Board> list() throws Exception {
		return mapper.list();
	}

=======
	public List<Board> list(PageRequest pageRequest) throws Exception {
		
		return mapper.list(pageRequest);
	} 
	
>>>>>>> master
	@Override
	public Board read(Board board) throws Exception {
		return mapper.read(board);
	}
<<<<<<< HEAD
	
=======

>>>>>>> master
	@Transactional
	@Override
	public int modify(Board board) throws Exception {
		return mapper.modify(board);
	}

	@Override
	public int remove(Board board) throws Exception {
		return mapper.remove(board);
<<<<<<< HEAD
	} 
=======
	}

	@Override
	public int count() throws Exception {
		return mapper.count();
	}

	
>>>>>>> master
}
