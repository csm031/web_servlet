<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        input{
            width: 200px;
            height: 30px;
            line-height: 30px;
            padding: 5px;
            margin: 5px;
        }

        input [type=submit]{
            width: 100px;
            height: 50px;
            margin-top: 20px;
        }
    </style>
    <title>로그인</title>
</head>
<body>
<form method="post" action="loginProcess.jsp" name="frm_Login">
    <input type="text" name="member_id" placeholder="아이디"> <br>
    <input type="password" name="member_pw" placeholder="비밀번호" > <br>
    <input type="submit" value="로그인">
</form>

    <%

        String msg = null;
//        request 객체의 속성에 저장된 값을 가져와서 처리하는 경우
//        msg = (String) request.getAttribute("msg");
//        param 액션 태그를 이용해서 전달된 값을 받아서 처리하는 경우
        msg = request.getParameter("msg");
        if (msg != null) {
            out.println("<p>"+msg+"</p>");
        }
    %>
</body>
</html>
