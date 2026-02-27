package com.project.mapper;

import java.util.List;

import com.project.domain.Member;
import com.project.domain.MemberAuth;

public interface MemberMapper {

	// 등록 처리
	public int register(Member member) throws Exception;

	// 권한 생성
	public void createAuth(MemberAuth memberAuth) throws Exception;

	// 목록 페이지
	public List<Member> list() throws Exception;

	// 상세 페이지
	public Member read(Member member) throws Exception;

	// 사용자 아이디로 상세 정보 조회 (시큐리티 로그인 시 사용)
	public Member readByUserId(Member member) throws Exception;

	// 수정 처리
	public int modify(Member member) throws Exception;

	// 권한 삭제
	public void deleteAuth(Member member) throws Exception;

	// 권한 수정
	public void modifyAuth(MemberAuth memberAuth) throws Exception;

	// 삭제 처리
	public int remove(Member member) throws Exception;

	// 전체 회원 수 조회
	public int countAll() throws Exception;

}