<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
			<spring:message code="board.header.modify" />
		</h2>

		<%-- 게시글 수정을 위한 폼 --%>
		<form:form modelAttribute="board" action="/board/modify" method="post">
			<form:hidden path="boardNo" />

			<%-- 페이징 및 페이지당 수량 유지를 위한 히든 필드 --%>
			<input type="hidden" name="page" value="${pgrq.page}">
			<input type="hidden" name="sizePerPage" value="${pgrq.sizePerPage}">

			<table>
				<tr>
					<td><spring:message code="board.title" /></td>
					<td><form:input path="title" /></td>
					<td><font color="red"><form:errors path="title" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.writer" /></td>
					<td><form:input path="writer" readonly="true" /></td>
					<td><font color="red"><form:errors path="writer" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.content" /></td>
					<td><form:textarea path="content" rows="10" cols="50" /></td>
					<td><font color="red"><form:errors path="content" /></font></td>
				</tr>
			</table>
		</form:form>

		<div style="margin-top: 10px;">
			<sec:authentication property="principal" var="principal" />

			<%-- 1. 관리자이거나 2. 본인일 경우에만 수정/삭제 버튼 노출 --%>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
				<c:if test="${principal.username eq board.writer || principal.authorities.contains('ROLE_ADMIN')}">
					<button type="button" id="btnModify">
						<spring:message code="action.modify" />
					</button>
					<button type="button" id="btnRemove">
						<spring:message code="action.remove" />
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
			let formObj = $("#board");

			// 수정 버튼 클릭 시 폼 제출
			$("#btnModify").on("click", function() {
				formObj.submit();
			});

			// 삭제 버튼 클릭 시
			$("#btnRemove").on("click", function() {
				if(confirm("정말 삭제하시겠습니까?")) {
					let boardNo = $("#boardNo").val();
					// pgrq.toUriString()을 사용하여 검색/페이징 정보 유지하며 이동
					self.location = "/board/remove${pgrq.toUriString()}&boardNo=" + boardNo;
				}
			});

			// 목록 버튼 클릭 시 기존 페이지 정보를 가지고 목록으로 회귀
			$("#btnList").on("click", function() {
				self.location = "/board/list${pgrq.toUriString()}";
			});
		});
	</script>
</body>
</html>