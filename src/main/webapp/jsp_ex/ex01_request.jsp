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
        out.println(name + " : " + request.getHeader(name) + "<br>");
    }

%>
<hr>
<h3>request 객체에 저장된 쿠키(Cookie) 정보들</h3>
<%
    //request 객체에 저장된 쿠키 정보 가져오기
    Cookie[] cookies = request.getCookies();

    for (Cookie cookie : cookies) {
        out.println(cookie.getName() + " : " + cookie.getValue()+"<br>" + " : "
                + cookie.getMaxAge()+"<br>" + " : " + cookie.getPath()+"<br>");
    }
    //쿠키에 대한 설정값은 JSP/서블릿에서는 name과 value만 확인 가능하고 유효기간은 -1로,
    // 경로는 null로 출력되는데 개발자도구(F12)에서 애플리케이션에 저장용량의 쿠키 부분을
    // 확인하면 쿠키 설정값을 확인할 수 있음
%>
<hr>
<h3>request 객체에 저장된 URL/URI, 요청방식 정보들</h3>
<hr>
<%
    out.println("서버의 도메인명 : " + request.getServerName() + "<br>");
    out.println("서버의 포트번호 : " + request.getServerPort() + "<br>");
    out.println("요청 URL : " + request.getRequestURL() + "<br>");
    out.println("요청 URI : " + request.getRequestURI() + "<br>");
    out.println("쿼리스트링 : " + request.getQueryString() + "<br>");
    out.println("클라이언트의 호스트명 : " + request.getRemoteHost() + "<br>");
    out.println("클라이언트의 IP주소 : " + request.getRemoteAddr() + "<br>");
    out.println("요청에 사용된 프로토콜 : " + request.getProtocol() + "<br>");
    out.println("요청방식 : " + request.getMethod() + "<br>");
    out.println("컨텍스트 패스 : " + request.getContextPath() + "<br>");

%>


</body>
</html>
