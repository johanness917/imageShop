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
			<spring:message code="board.header.list" />
		</h2>

		<!-- 검색 폼을 만든다. -->
		<form:form modelAttribute="pgrq" method="get"
			action="list${pgrq.toUriStringByPage()}">
			<form:select path="searchType" items="${searchTypeCodeValueList}"
				itemValue="value" itemLabel="label" />

			<form:input path="keyword" />
			<button id='searchBtn'>
				<spring:message code="action.search" />
			</button>
		</form:form>

		<br>

		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<a href="/board/register"><spring:message code="action.new" /></a>
		</sec:authorize>

		<table border="1">
			<tr>
				<th align="center" width="80"><spring:message code="board.no" /></th>
				<th align="center" width="100"><spring:message
						code="board.title" /></th>
				<th align="center" width="100"><spring:message
						code="board.writer" /></th>
				<th align="center" width="320"><spring:message
						code="board.content" /></th>
				<th align="center" width="180"><spring:message
						code="board.regdate" /></th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="5"><spring:message code="common.listEmpty" /></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="board">
						<tr>
							<td align="center">${board.boardNo}</td>
							<td align="left">
								<%-- 페이징 및 상세 조회를 위한 링크 (Pagination 객체 사용) --%> <a
								href='/board/read${pagination.makeQuery(pagination.pageRequest.page)}&boardNo=${board.boardNo}'>
									${board.title} </a>
							</td>
							<td align="right">${board.writer}</td>
							<td align="right">${board.content}</td>
							<td align="center"><fmt:formatDate
									pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<hr>

		<div>
			<c:if test="${empty pgrq.keyword}">
				<c:if test="${pagination.prev}">
					<!-- ?page=3&sizePerPage=10" -->
					<a
						href="/board/list${pagination.makeQuery(pagination.startPage - 1)}">&laquo;</a>
				</c:if>
				<c:forEach begin="${pagination.startPage }"
					end="${pagination.endPage }" var="idx">
					<c:if test="${pagination.pageRequest.page eq idx}">
						<a href="/board/list${pagination.makeQuery(idx)}">[${idx}]</a>
					</c:if>
					<c:if test="${!(pagination.pageRequest.page eq idx)}">
						<a href="/board/list${pagination.makeQuery(idx)}">${idx}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pagination.next && pagination.endPage > 0}">
					<a href="/board/list${pagination.makeQuery(pagination.endPage +1)}">&raquo;</a>
				</c:if>
			</c:if>
		</div>
	</div>

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