package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Member;
import com.project.domain.MemberAuth;
import com.project.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;

	@Transactional
	@Override
	public int register(Member member) throws Exception {
		int count = mapper.register(member);

		if (count != 0) {
			// 회원 권한 생성 (기본 권한: ROLE_MEMBER)
			MemberAuth memberAuth = new MemberAuth();
			memberAuth.setUserNo(member.getUserNo());
			memberAuth.setAuth("ROLE_MEMBER");
			mapper.createAuth(memberAuth);
		}

		return count;
	}

	@Override
	public List<Member> list() throws Exception {
		return mapper.list();
	}

	@Override
	public Member read(Member member) throws Exception {
		return mapper.read(member);
	}

	@Transactional
	@Override
	public int modify(Member member) throws Exception {
		// 회원정보 수정
		int count = mapper.modify(member);

		// 기존 회원권한 삭제 후 재등록 (수정 로직)
		mapper.deleteAuth(member);

		// 사용자가 선택한 권한내용을 가져와서 등록
		List<MemberAuth> authList = member.getAuthList();
		for (int i = 0; i < authList.size(); i++) {
			MemberAuth memberAuth = authList.get(i);
			String auth = memberAuth.getAuth();

			if (auth == null || auth.trim().length() == 0) {
				continue;
			}

			memberAuth.setUserNo(member.getUserNo());
			mapper.createAuth(memberAuth); // 권한 생성 메서드 호출
		}

		return count;
	}

	@Transactional
	@Override
	public int remove(Member member) throws Exception {
		// 회원 권한 삭제 먼저 진행 후 회원 탈퇴 처리
		mapper.deleteAuth(member);
		return mapper.remove(member);
	}

	@Override
	public int countAll() throws Exception {
		return mapper.countAll();
	}

	@Transactional
	@Override
	public void setupAdmin(Member member) throws Exception {
		// 관리자 계정 생성
		int count = mapper.register(member);

		if (count != 0) {
			// 관리자 권한 부여
			MemberAuth memberAuth = new MemberAuth();
			memberAuth.setUserNo(member.getUserNo());
			memberAuth.setAuth("ROLE_ADMIN");
			mapper.createAuth(memberAuth);
		}
	}
}