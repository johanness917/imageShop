<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<<<<<<< HEAD
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
=======
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
>>>>>>> master

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
			<spring:message code="board.header.read" />
		</h2>

		<form:form modelAttribute="board">
			<form:hidden path="boardNo" />
<<<<<<< HEAD
=======
			<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
			<input type="hidden" id="page" name="page" value="${pgrq.page}">
			<input type="hidden" id="sizePerPage" name="sizePerPage" value="${pgrq.sizePerPage}">
>>>>>>> master
			<table>
				<tr>
					<td><spring:message code="board.title" /></td>
					<td><form:input path="title" readonly="true" /></td>
					<td><font color="red"><form:errors path="title" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.writer" /></td>
					<td><form:input path="writer" readonly="true" /></td>
					<td><font color="red"><form:errors path="writer" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.content" /></td>
					<td><form:textarea path="content" readonly="true" /></td>
					<td><font color="red"><form:errors path="content" /></font></td>
				</tr>
			</table>
		</form:form>

		<div>
			<!-- 사용자정보를 가져온다. -->
<<<<<<< HEAD
			<sec:authentication property="principal" var="principal"/>
=======
			<sec:authentication property="principal" var="principal" />
>>>>>>> master
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="submit" id="btnEdit">
					<spring:message code="action.edit" />
				</button>
				<button type="submit" id="btnRemove">
					<spring:message code="action.remove" />
				</button>
			</sec:authorize>
<<<<<<< HEAD
			
=======

>>>>>>> master
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<c:if test="${principal.username eq board.writer}">
					<button type="submit" id="btnEdit">
						<spring:message code="action.edit" />
					</button>
					<button type="submit" id="btnRemove">
						<spring:message code="action.remove" />
					</button>
				</c:if>
			</sec:authorize>
<<<<<<< HEAD
			
=======

>>>>>>> master
			<button type="submit" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			let formObj = $("#board");

			$("#btnEdit").on("click", function() {
<<<<<<< HEAD
				let boardNo = $("#boardNo")
				self.location = "/board/modify?boardNo="+boardNo.val();
			});

			$("#btnRemove").on("click", function() {
				let boardNo = $("#boardNo")
				self.location = "/board/remove?boardNo="+boardNo.val();
			});

			$("#btnList").on("click", function() {
				self.location = "/board/list";
=======
				let boardNo = $("#boardNo").val();
				let page = $("#page").val(); 
        		let sizePerPage = $("#sizePerPage").val(); 
        		self.location = "/board/modify?page="+page+"&sizePerPage="+sizePerPage+"&boardNo="+boardNo;
			});

			$("#btnRemove").on("click", function() {
				let boardNo = $("#boardNo").val();
				let page = $("#page").val(); 
        		let sizePerPage = $("#sizePerPage").val();
        		self.location = "/board/remove?page="+page+"&sizePerPage="+sizePerPage+"&boardNo="+boardNo;
			});

			$("#btnList").on("click", function() {
				let page = $("#page").val(); 
        		let sizePerPage = $("#sizePerPage").val();
        		self.location = "/board/list?page="+page+"&sizePerPage="+sizePerPage;
>>>>>>> master
			});

		});
	</script>
</body>
</html>