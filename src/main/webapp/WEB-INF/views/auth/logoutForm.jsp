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
		
<<<<<<< HEAD
		<form method="post" action="/auth/login">
=======
		<form method="post" action="/auth/logout">
>>>>>>> master
			<table>
				<tr>
					<td align="center">
						<button>
<<<<<<< HEAD
							<spring:message code="action.logout" />
=======
						  <spring:message code="action.logout" />
>>>>>>> master
						</button>
					</td>
				</tr>
			</table>
			<sec:csrfInput />
		</form>
<<<<<<< HEAD

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
=======
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

>>>>>>> master
</body>
</html>