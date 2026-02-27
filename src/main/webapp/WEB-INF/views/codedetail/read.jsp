<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
			<spring:message code="codegroup.header.read" />
		</h2>
		<form:form modelAttribute="codeDetail">
			<form:hidden path="groupCode" />
			<table>
				<tr>
					<td><spring:message code="codedetail.groupCode" /></td>
					<td><form:select path="groupCode" items="${groupCodeList}"
							itemValue="value" itemLabel="label" disabled="true" /></td>
					<td><font color="red"><form:errors path="groupCode" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="codedetail.codeValue" /></td>
					<td><form:input path="codeValue" readonly="true" /></td>
					<td><font color="red"><form:errors path="codeValue" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="codedetail.codeName" /></td>
					<td><form:input path="codeName" readonly="true" /></td>
					<td><font color="red"><form:errors codeName" /></font></td>
				</tr>
			</table>
		</form:form>

		<div style="margin-top: 10px;">
			<button type="button" id="btnEdit">
				<spring:message code="action.edit" />
			</button>
			<button type="button" id="btnRemove">
				<spring:message code="action.remove" />
			</button>
			<button type="button" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			let formObj = $("#codeDetail");

			// 수정 화면으로 이동
			$("#btnEdit").on("click", function() {
				formObj.attr("action", "/codedetail/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			// 삭제 처리 (get 방식으로 전송)
			$("#btnRemove").on("click", function() {
				if (confirm("정말 삭제하시겠습니까?")) {
					formObj.attr("action", "/codedetail/remove");
					formObj.attr("method", "get");
					formObj.submit();
				}
			});

			// 목록으로 이동
			$("#btnList").on("click", function() {
				self.location = "/codedetail/list";
			});
		});
	</script>
</body>
</html>