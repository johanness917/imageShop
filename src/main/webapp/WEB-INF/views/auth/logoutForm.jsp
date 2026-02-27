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
			<spring:message code="auth.header.logout" />
		</h2>

		<%-- 로그아웃 처리를 수행할 URL 주소를 정확히 지정합니다. --%>
		<form method="post" action="/auth/logout">
			<table>
				<tr>
					<td align="center">
						<button type="submit">
							<spring:message code="action.logout" />
						</button>
					</td>
				</tr>
			</table>
			<%-- POST 방식 로그아웃 시 CSRF 토큰은 필수입니다. --%>
			<sec:csrfInput />
		</form>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>