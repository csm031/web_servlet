<%@ page import="java.util.Enumeration" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="">
<head>
    <title>response 객체</title>
</head>
<body>

<h3>response 객체를 이용해서 HTTP 응답헤더에 값 추가하기 </h3>
<%
    //날짜 형식의 값 추가하기
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    long dateVal = sdf.parse("2024-04-30").getTime();
    //1970.1.1.0시0분0초부터 2024.4.30(KST를 GMT로 환산한 값:9시간을 뺌)까지를 밀리초로 환산
    response.addDateHeader("drawDate",dateVal);

    //숫자 값 추가하기
    response.addIntHeader("lunckyNumber", 1004);

    //문자열 값 추가하기
    response.addHeader("prizeWinner", "홍길동");
%>

<hr>
<h3>HTTP 응답헤더에 저장된 값 확인하기 </h3>
<hr>
<%
    Collection<String> headerNames = response.getHeaderNames();

    for (String name : headerNames) {
        out.println(name + " : " + response.getHeader(name)+"<br>");
    }
%>

</body>
</html>
