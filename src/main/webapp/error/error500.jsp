<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>500에러페이지</title>
<style>
    a{
        text-decoration: none;
        font: bold 15px Arial, sans-serif;
        color: black;
    }
</style>
</head>
<body>

<h3>에러코드 : 500</h3>
<hr>
<p>
    요청한 페이지와 관련하여 시스템에 오류가 있습니다.<br>
    빠른 시일 내에 정상적인서비스가 되도록 하겠습니다.
</p>
<br>
<a href="${pageContext.request.contextPath}/index.jsp"><span>홈</span></a>

</body>
</html>
