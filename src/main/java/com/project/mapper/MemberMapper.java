package com.project.mapper;

import java.util.List;

import com.project.domain.Member;
import com.project.domain.MemberAuth;

public interface MemberMapper {
<<<<<<< HEAD
	// 등록 처리
	public int register(Member member) throws Exception;

	// 권한 생성
	public void createAuth(MemberAuth memberAuth) throws Exception;

	// 목록 페이지
	public List<Member> list() throws Exception;

	// 상세 페이지
	public Member read(Member member) throws Exception;
	
	public Member readByUserId(Member member) throws Exception;

	// 수정 처리
=======

	public int register(Member member) throws Exception;

	public void createAuth(MemberAuth memberAuth) throws Exception;

	public List<Member> list()throws Exception;

	public Member read(Member member) throws Exception;

	public Member readByUserId(Member member) throws Exception;

>>>>>>> master
	public int modify(Member member) throws Exception;

	public void deleteAuth(Member member) throws Exception;

<<<<<<< HEAD
	// 권한 수정
=======
>>>>>>> master
	public void modifyAuth(MemberAuth memberAuth) throws Exception;

	public int remove(Member member) throws Exception;

	public int countAll() throws Exception;

}
