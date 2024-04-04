<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="">
<head>
    <title>requst객체</title>
</head>
<body>

<h3>request객체에 저장된 HTTP 헤더 정보들</h3>
<hr>
<%
    //HTTP 요청헤더에 저장된 모든 헤더 이름을 열거형(Enumeration) 객체로 가져오기
    Enumeration<String> headerNames = request.getHeaderNames();

    while (headerNames.hasMoreElements()) {
        String name = headerNames.nextElement();
        out.println(name + " : " + request.getHeader(name) + "<br");
    }

%>
<hr>
<h3>request 객체에 저장된 쿠키(Cookie) 정보들</h3>
<%
    //request 객체에 저장된 쿠키 정보 가져오기
    Cookie[] cookies = request.getCookies();

    for (Cookie cookie : cookies) {
        out.println(cookie.getName() + " : " + cookie.getValue()+"<br>");
    }

%>
</body>
</html>
