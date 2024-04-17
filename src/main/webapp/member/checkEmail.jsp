<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id ="emailManager" class="human.web.common.EmailManager" />
<c:set var="authNumber" value="${emailManager.checkEmail(param.email)}" />
<c:out value="${authNumber}" />