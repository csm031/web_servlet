<%@ page import="human.web.member.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        input {
            width: 200px;
            height: 30px;
            line-height: 30px;
            padding: 5px;
            margin: 5px;
        }

        input [type=submit], input[type=button] {
            width: 100px;
            height: 50px;
            margin-top: 20px;
        }
    </style>
    <title>정보 변경</title>
</head>
<body>
<h2>회원 정보 변경</h2>
<hr>
<form method="post" action="updateProcess.jsp" name="frm_update">
    <input type="hidden" name="m_idx" value="${member.m_idx}">
    <input type="text" name="member_id" value="${member.member_id}" disabled><br>
    <input type="password" name="member_pw" value="${member.member_pw}"><br>
    <input type="text" name="member_name" value="${member.member_name}"><br>
    <input type="text" name="nickname" value="${member.nickname}"><br>
    <input type="text" name="handphone" value="${member.handphone}"><br>
    <input type="text" name="email" value="${member.email}"><br>
    <input type="submit" value="수정하기">
    <input type="button" value="취소하기" onclick="location.href='../index.jsp'">
</form>
<%
    String msg = null;
    msg = (String) request.getAttribute("msg");
    if (msg != null) {
        out.println("<p>"+msg+"</p>");
    }
%>
</body>
</html>
