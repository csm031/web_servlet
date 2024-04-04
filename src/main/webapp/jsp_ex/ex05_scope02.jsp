<%@ page import="java.util.Enumeration" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <title>속성(attribute)과 영역(scope)</title>
</head>
<body>

<h3>각 영역별로 동일한 이름의 속성을 추가하고 결과값 확인하기</h3>
<hr>
<%

    //현재 JSP페이지에서 속성으로 저장된 값 유효범위 확인하기
    out.println("page영역 : " + pageContext.getAttribute("name")+"<br>");
    out.println("request영역 : " + request.getAttribute("name")+"<br>");
    out.println("session영역 : " + session.getAttribute("name")+"<br>");
    out.println("application영역 : " + application.getAttribute("name")+"<br>");
%>
</body>
</html>
