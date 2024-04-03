<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%//스크립트릿 : 서블릿으로 변환될 경우 _jspService()메소드 내에 포함되는 내용

//로그아웃 처리
//기존의 세션객체에 저장된 내용을 초기화시킴: invalidate()
session.invalidate();

//메인 페이지로 이동
response.sendRedirect("../index.jsp");

%>    