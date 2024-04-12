<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="b_idx" value="${param.b_idx}" />

<jsp:useBean id="dao" class="human.web.dao.BoardDAO"/>
<c:if test="${member.m_idx eq m_idx}"/>
<c:set var="result" value="${dao.deleteBoard(b_idx)}" />

<c:choose>
	<c:when test="${result eq 1}">
		<c:redirect url="/board/list.jsp" context="${pageContext.request.contextPath}" />
	</c:when>
	<c:otherwise>
		<script>
		alert("글 삭제에 실패했습니다");
		history.back();
		</script>
	</c:otherwise>
</c:choose>   