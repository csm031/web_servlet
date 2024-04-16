<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="human.web.*" %>
<jsp:useBean id="dto" class="human.web.dto.MemberDTO" />
<jsp:setProperty name="dto" property="*" />
<jsp:useBean id="dao" class="human.web.dao.MemberDAO"/>


<c:set var="result" value="${dao.join(dto)}"/>

<c:choose>
    <c:when test="${result eq 1}">
    <c:redirect url="../index.jsp"/>
    </c:when>
    <c:otherwise>
        <c:redirect url="join.jsp"/>
    </c:otherwise>
</c:choose>