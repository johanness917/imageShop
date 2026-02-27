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
			<spring:message code="notice.header.read" />
		</h2>

		<form:form modelAttribute="notice">
			<form:hidden path="noticeNo" />
			<table>
				<tr>
					<td><spring:message code="notice.title" /></td>
					<td><form:input path="title" readonly="true" /></td>
					<td><font color="red"><form:errors path="title" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="notice.content" /></td>
					<td><form:textarea path="content" readonly="true" /></td>
					<td><font color="red"><form:errors path="content" /></font></td>
				</tr>
			</table>

		</form:form>

		<div style="margin-top: 10px;">
			<sec:authentication property="principal" var="principal" />

			<%-- 관리자 권한 --%>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="button" id="btnEdit">
					<spring:message code="action.edit" />
				</button>
				<button type="button" id="btnRemove">
					<spring:message code="action.remove" />
				</button>
			</sec:authorize>

			<%-- 일반 회원이고 작성자 본인일 때 --%>
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<c:if test="${principal.username eq board.writer}">
					<button type="button" id="btnEdit">
						<spring:message code="action.edit" />
					</button>
				</c:if>
			</sec:authorize>

			<button type="button" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			var formObj = $("#notice");
			console.log(formObj);
			$("#btnEdit").on("click", function() {
				let noticeNo = $("#noticeNo").val();
				self.location = "/notice/modify?noticeNo=" + noticeNo;
			});
			$("#btnRemove").on("click", function() {
				let noticeNo = $("#noticeNo").val();
				self.location = "/notice/remove?noticeNo=" + noticeNo;
			});
			$("#btnList").on("click", function() {
				self.location = "/board/list"
			});
		});
	</script>
</body>
</html>