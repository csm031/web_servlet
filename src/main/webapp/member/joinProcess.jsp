<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="human.web.member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="dto" class="human.web.member.MemberDTO" />
<jsp:setProperty name="dto" property="*" />
<jsp:useBean id="dao" class="human.web.member.MemberDAO"/>


<c:set var="reslut" value="${dao.join(dto)}"/>

<c:choose>
    <c:when test="${reslut eq 1}">
    <c:redirect url="../index.jsp"/>
    </c:when>
    <c:otherwise>
        <c:redirect url="join.jsp"/>
    </c:otherwise>
</c:choose>