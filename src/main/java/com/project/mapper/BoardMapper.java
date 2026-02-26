package com.project.mapper;

import java.util.List;

<<<<<<< HEAD
=======
import com.project.common.domain.PageRequest;
>>>>>>> master
import com.project.domain.Board;

public interface BoardMapper {

	public int register(Board board) throws Exception;

	public List<Board> list()throws Exception;

<<<<<<< HEAD
	public Board read(Board board) throws Exception;

	public int modify(Board board) throws Exception;

	public int remove(Board board) throws Exception;

=======
	public List<Board> list(PageRequest pageRequest) throws Exception;

	public Board read(Board board) throws Exception;

	public int modify(Board board)throws Exception;

	public int remove(Board board)throws Exception;

	public int count()throws Exception;
>>>>>>> master
}
