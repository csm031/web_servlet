<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="human.web.util.Conversion" %>
<jsp:useBean id="dto" class="human.web.dto.EmailDTO"/>
<jsp:setProperty name="dto" property="*"/>

<c:choose>
    <c:when test='${dto.format eq "text"}'>
        <jsp:setProperty name="dto" property="format" value="text/plain;charset=UTF-8"/>
    </c:when>
    <c:otherwise>
        <c:set var="htmlContent" value="${Conversion.contentToHTML(pageContext.servletContext, dto.content)}"/>
        <jsp:setProperty name="dto" property="content" value="${htmlContent}"/>
        <jsp:setProperty name="dto" property="format" value="text/html;charset=UTF-8"/>
    </c:otherwise>
</c:choose>

<jsp:useBean id="emailManager" class="human.web.common.EmailManager"/>
<c:catch var="exception">
    ${emailManager.sendEmail(dto)} <br>
</c:catch>

<c:choose>
    <c:when test="${empty exception}">
        <h3>이메일 전송 성공</h3>
    </c:when>
    <c:otherwise>
        <h3>이메일 전송 실패</h3>
    </c:otherwise>
</c:choose>