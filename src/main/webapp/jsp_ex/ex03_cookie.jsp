<%@ page import="java.util.Enumeration" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="">
<head>
    <title>Cookie 객체</title>
</head>
<body>

<h3>Cookie 객체를 생성해서 response 객체에 추가하기</h3>
<hr>
<%
    //제품번호(pid)를 이름으로 하고 123456을 값으로 해서 쿠키객체를 생성하고
    //유효기간을 2일로 해당 웹프로그램에서는 모두 사용할 수 있는 쿠키로 저장하기
    Cookie cookie01 = new Cookie("pid", "123456");
    cookie01.setPath(request.getContextPath());
    cookie01.setMaxAge(60*60*24*2);
    response.addCookie(cookie01);

    //회원아이디(mid)를 이름으로 하고 hong 을 값으로 해서 쿠키객체를 생성하고
    //유효기간을 1일로 해당 웹프로그램에서는 모두 사용할 수 있는 쿠키로 저장하기
    Cookie cookie02 = new Cookie("mid", "hong");
    cookie01.setPath(request.getContextPath());
    cookie01.setMaxAge(60*60*24);
    response.addCookie(cookie02);

%>
</body>
</html>
