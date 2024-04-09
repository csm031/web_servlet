<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 기존에 세션객체에 저장된 member객체를 삭제함 -->
<c:remove var="member" scope="session"/>
<c:redirect url="../index.jsp"/>