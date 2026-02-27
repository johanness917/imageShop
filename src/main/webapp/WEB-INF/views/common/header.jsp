<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div align="right">
	<table>
		<tr>
			<sec:authorize access="!isAuthenticated()">
				<td width="80"><a href="/user/register"><spring:message
							code="header.joinMember" /></a></td>
				<td width="80"><a href="/auth/login"><spring:message
							code="header.login" /></a></td>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<td width="180"><sec:authentication
						property="principal.username" /> 님 <a href="/auth/logout"> <spring:message
							code="header.logout" /></a></td>
			</sec:authorize>
		</tr>
	</table>
</div>
<hr>