package com.project.mapper;

import java.util.List;

import com.project.domain.Member;
import com.project.domain.UserItem;

public interface UserItemMapper {
	// 구매 상품 등록 처리
	public int create(UserItem userItem) throws Exception;

	public List<UserItem> list(Member member) throws Exception;

	public UserItem read(UserItem userItem) throws Exception;

}
