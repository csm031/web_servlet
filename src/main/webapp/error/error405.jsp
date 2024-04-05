<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>405에러페이지</title>
<style>
    a{
        text-decoration: none;
        font: bold 15px Arial, sans-serif;
        color: black;
    }
</style>
</head>
<body>

<h3>에러코드 : 405</h3>
<hr>
<p>
    잘못된 페이지 요청방식입니다.<br>
    다시 한 번 확인해 주세요.
</p>
<br>
<a href="${pageContext.request.contextPath}/index.jsp"><span>홈</span></a>

</body>
</html>
