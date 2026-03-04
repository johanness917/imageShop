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
			<spring:message code="useritem.header.read" />
		</h2>

		<c:if test="${not empty userItem}">
			<form:form modelAttribute="userItem">
				<form:hidden path="userItemNo" />
				<input type="hidden" id="itemId" value="${userItem.itemId}">

				<table>
					<tr>
						<td><spring:message code="useritem.itemName" /></td>
						<td><form:input path="itemName" readonly="true" /></td>
					</tr>
					<tr>
						<td><spring:message code="useritem.itemPrice" /></td>
						<td><form:input path="price" readonly="true" /></td>
					</tr>
					<tr>
						<td><spring:message code="useritem.itemFile" /></td>
						<td><img src="/item/display?itemId=${userItem.itemId}"
							width="210"></td>
					</tr>
					<tr>
						<td><spring:message code="useritem.itemDescription" /></td>
						<td><form:textarea path="description" readonly="true" /></td>
					</tr>
				</table>
			</form:form>
		</c:if>

		<div style="margin-top: 10px; border: 1px solid #ccc; padding: 10px;">
			<sec:authentication property="principal" var="principal" />

			<div style="font-size: 10px; color: blue; margin-bottom: 10px;">
				접속자: [${principal.username}] / 소유자: [${userItem.owner}]</div>

			<%-- 1. 관리자(ADMIN): 무조건 수정/삭제 가능 --%>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="button" id="btnEdit">관리자 수정</button>
				<button type="button" id="btnRemove">관리자 삭제</button>
			</sec:authorize>

			<%-- 2. 일반 회원(MEMBER) --%>
			<sec:authorize
				access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
				<c:choose>
					<%-- 본인 상품인 경우: 수정 / 삭제만 보임 --%>
					<c:when
						test="${not empty userItem.owner and principal.username eq userItem.owner}">
						<button type="button" id="btnEdit">
							<spring:message code="action.edit" />
						</button>
						<button type="button" id="btnRemove">
							<spring:message code="action.remove" />
						</button>
					</c:when>

					<%-- 남의 상품인 경우: 구매하기 / 목록만 보임 --%>
					<c:otherwise>
						<button type="button" id="btnBuy"
							style="background-color: #007bff; color: white;">구매하기</button>
					</c:otherwise>
				</c:choose>
			</sec:authorize>

			<%-- 3. 공통: 목록 --%>
			<button type="button" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

		<script>
			$(document)
					.ready(
							function() {
								let userItemNo = $("#userItemNo").val();

								$("#btnList").on("click", function() {
									self.location = "/useritem/list";
								});

								$("#btnEdit")
										.on(
												"click",
												function() {
													self.location = "/useritem/modify?userItemNo="
															+ userItemNo;
												});

								$("#btnRemove")
										.on(
												"click",
												function() {
													if (confirm("정말 삭제하시겠습니까?")) {
														self.location = "/useritem/remove?userItemNo="
																+ userItemNo;
													}
												});

								// 구매 버튼 클릭 이벤트
								$("#btnBuy")
										.on(
												"click",
												function() {
													if (confirm("정말 구매하시겠습니까?")) {
														self.location = "/useritem/buy?userItemNo="
																+ userItemNo;
													}
												});
							});
		</script>
</body>
</html>