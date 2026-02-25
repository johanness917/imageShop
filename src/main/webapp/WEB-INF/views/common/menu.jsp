<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<div align="right"> 
 <table> 
  <tr> 
   <td width="80"><a href="/"><spring:message code="header.home" /></a></td>

   <!-- 인증을 하지 않았을 때 메뉴 --> 
   <sec:authorize access="isAuthenticated()"> 
        <td width="80"><a href="/user/register"><spring:message code="header.joinMember" /></a></td> 
   </sec:authorize>

   <!-- 인증을 했을 때 메뉴 (인가: 관리자, 회원, 매니저 --> 
   <sec:authorize access="isAuthenticated()">
       <!-- 인증완료(인가: 관리자)일 때 들어갈 메뉴 --> 
        <sec:authorize access="hasRole('ROLE_ADMIN')">
             <!-- 코드그룹관리 메뉴 --> 
               <td width="120"><a href="/codegroup/list"><spring:message code="menu.codegroup.list" /></a></td> 
               <!-- 코드관리 메뉴 --> 
               <td width="120"><a href="/codedetail/list"><spring:message code="menu.codedetail.list" /></a></td>
                <!-- 회원관리 메뉴 --> 
               <td width="120"><a href="/user/list"><spring:message code="menu.user.admin" /></a></td>
           </sec:authorize>

       <!-- 인증완료(인가: 회원)일 때 들어갈 메뉴 --> 
        <sec:authorize access="hasRole('ROLE_MEMBER')">

           </sec:authorize>

   </sec:authorize> 
  </tr> 
 </table>
 </div>
 <hr>