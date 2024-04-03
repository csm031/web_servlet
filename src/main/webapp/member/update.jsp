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
<% // 세션에 저장되어 있는 회원정보를 가져오기 위해 스크립트릿 사용
    MemberDTO dto = (MemberDTO) session.getAttribute("member");
    //각각의 input양식에 값을 출력하기 위해 표현식 사용
%>
<form method="post" action="updateProcess.jsp" name="frm_update">
    <input type="hidden" name="m_idx" value="<%=dto.getM_idx()%>">
    <input type="text" name="member_id" value="<%= dto.getMember_id()%>" disabled><br>
    <input type="password" name="member_pw" value="<%=dto.getMember_pw()%>"><br>
    <input type="text" name="member_name" value="<%=dto.getMember_name()%>"><br>
    <input type="text" name="nickname" value="<%=dto.getNickname()%>"><br>
    <input type="text" name="handphone" value="<%=dto.getHandphone()%>"><br>
    <input type="text" name="email" value="<%=dto.getEmail()%>"><br>
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
