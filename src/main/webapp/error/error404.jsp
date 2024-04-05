<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404에러페이지</title>
<style>
    a{
        text-decoration: none;
        font: bold 15px Arial, sans-serif;
        color: black;
    }
</style>
</head>
<body>

<h3>에러코드 : 404</h3>
<hr>
<p>
    요청한 페이지를 찾을 수 없습니다.<br>
    페이지 주소를 다시 한 번 확인해 주세요.
</p>
<br>
<a href="${pageContext.request.contextPath}/index.jsp"><span>홈</span></a>

</body>
</html>
