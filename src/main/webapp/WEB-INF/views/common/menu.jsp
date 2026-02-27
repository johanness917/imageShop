<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div align="right">
	<table>
		<tr>
			<td width="80"><a href="/"><spring:message
						code="header.home" /></a></td>
			<!-- 비회원 -->
			<sec:authorize access="!isAuthenticated()">
			<!-- 회원게시판리스트 -->
				<td width="100"><a href="/user/register"><spring:message
							code="header.joinMember" /></a></td>
				<td width="120"><a href="/board/list">회원게시판리스트</a></td>
				<!-- 공지사항리스트. -->
				<td width="120"><a href="/notice/list"><spring:message	code="menu.notice.member" /></a></td>
			</sec:authorize>
			<!-- 회원 -->
			<sec:authorize access="isAuthenticated()">

				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<td width="120"><a href="/codegroup/list"><spring:message
								code="menu.codegroup.list" /></a></td>
					<td width="120"><a href="/codedetail/list"><spring:message
								code="menu.codedetail.list" /></a></td>
					<td width="120"><a href="/user/list"><spring:message
								code="menu.user.admin" /></a></td>
					<!-- 공지사항리스트. -->
				<td width="120"><a href="/notice/list"><spring:message	code="menu.notice.member" /></a></td>
				
				<!-- 인증완료 -->
				</sec:authorize>
				<!-- 회원 -->
				<td width="120"><a href="/board/list">회원게시판리스트</a></td>
				<!-- 공지사항리스트. -->
				<td width="120"><a href="/notice/list"><spring:message	code="menu.notice.member" /></a></td>

			</sec:authorize>
		</tr>
	</table>
</div>
<hr>