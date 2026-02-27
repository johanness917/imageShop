<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Shop</title>
<link rel="stylesheet" href="/css/user.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div align="center">
		<h2>
			<spring:message code="auth.header.login" />
		</h2>
		<%-- 에러 메시지나 로그아웃 메시지 출력 --%>
		<h2 style="color: red;">
			<c:out value="${error}" />
		</h2>
		<h2 style="color: blue;">
			<c:out value="${logout}" />
		</h2>

		<form method="post" action="/login">
			<table>
				<tr>
					<td><spring:message code="user.userId" /></td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td><spring:message code="user.userPw" /></td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="checkbox" name="remember-me"> <spring:message
							code="auth.rememberMe" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">
							<spring:message code="action.login" />
						</button>
					</td>
				</tr>
			</table>
			<%-- 스프링 시큐리티 CSRF 토큰 --%>
			<sec:csrfInput />
		</form>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>