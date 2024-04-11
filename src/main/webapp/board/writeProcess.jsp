<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="fileProcess" class="human.web.common.FileProcess" />
<c:set var="dto" 
  value="${fileProcess.fileProcess(pageContext.servletContext, pageContext.request)}" />

<jsp:useBean id="dao" class="human.web.dao.BoardDAO"/>
<c:set var="result" value="${dao.insertBoard(dto)}" />

<c:choose>
	<c:when test="${result eq 1}">
		<c:redirect url="/board/list.jsp" context="${pageContext.request.contextPath}" />
	</c:when>
	<c:otherwise>
		<script>
		alert("글등록에 실패했습니다");
		history.back();
		</script>
	</c:otherwise>
</c:choose>   