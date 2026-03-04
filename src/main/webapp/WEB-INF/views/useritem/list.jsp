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
<link rel="stylesheet" href="/css/codegroup.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div align="center">
		<h2>
			<spring:message code="useritem.header.list" />
		</h2>

		<table border="1">
			<tr>
				<th align="center" width="80"><spring:message code="useritem.no" /></th>
				<th align="center" width="100"><spring:message code="useritem.itemName" /></th>
				<th align="center" width="100"><spring:message code="useritem.itemPrice" /></th>
				<th align="center" width="180"><spring:message code="useritem.regdate" /></th>
				<th align="center" width="180"><spring:message code="useritem.download" /></th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="5"><spring:message code="common.listEmpty" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="useritem">
						<tr>
							<td align="center">${useritem.userItemNo}</td>
							<td align="left">
							<a	href="/useritem/read?userItemNo=${useritem.userItemNo}">${useritem.itemName}</a></td>
							<td align="right">${useritem.price}</td>
							<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${useritem.regDate}" /></td>
							<td align="center">
							<a href="/useritem/download?userItemNo=${useritem.userItemNo}">DOWNLOAD</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>


	</div>
	<!-- 메인화면 작업 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		var result = "${msg}";
		if (result === "SUCCESS") {
			alert("<spring:message code='common.processSuccess' />");
		} else if (result === "FAIL") {
			alert("처리내용 실패");
		}
	</script>
</body>
</html>