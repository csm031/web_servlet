<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="human.web.member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dto" class="human.web.member.MemberDTO"/>
<jsp:useBean id="dao" class="human.web.member.MemberDAO"/>

<c:set var="m_idx" value="${member.m_idx}"/>

<c:set var="result" value="${dao.cancel(member.m_idx)}"/>

<c:choose>
    <c:when test="${result eq 1}">
        <c:remove var="member" scope="session"/>
        <c:redirect url="../index.jsp"/>
    </c:when>

    <c:otherwise>

        <jsp:forward page="../index.jsp">
            <jsp:param name="msg" value="시스템의 문제로 회원탈퇴가 이루어지지 않았습니다. 빠른 시일 내에 시스템을 정상화하겠습니다"/>
        </jsp:forward>

    </c:otherwise>
</c:choose>