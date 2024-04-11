<%@ page import="human.web.dto.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>
    <title>메인페이지</title>
    <style>
        a {
            font-size: 20px;
        }
    </style>
</head>
<body>
<h3>메인페이지</h3>
<hr>
<c:choose>
    <c:when test="${not empty member}">
        <!-- 회원에게 보여지는 화면 -->
        ${member.nickname}님 환영합니다.<br>
        <a href="member/update.jsp">회원정보변경</a><br>
        <!-- 로그아웃은 별도의 화면을 필요로 하지 않기 때문에 바로 서버에 URL로 로그아웃 요청함 (get 방식)-->
        <a href="member/logoutProcess.jsp">로그아웃</a><br>
        <a href="javascript:cancel();">회원탈퇴</a><br>
        <hr>
        <a href="board/list.jsp">글 목록</a><br>
        <a href="board/write.jsp">글 쓰기</a><br>
        <!-- 회원정보 탈퇴 실패 시 메시지 출력 -->
        <p> ${not empty param.msg ? param.msg : " "}</p>
    </c:when>
    <c:otherwise>
        <!--비회원에게 보여지는 화면-->
        <a href="member/join.jsp">회원가입</a><br>
        <a href="member/login.jsp">로그인</a><br>
        <a href="board/list.jsp">글 목록</a><br>
    </c:otherwise>
</c:choose>
<script>
    cancel = () => {    // 회원 탈퇴에 대한 처리 함수
        // confirm 창에 확인을 클릭하면 true, 취소를 클릭하면 false 반환
        const answer = confirm("정말 회원탈퇴를 하시겠습니까?")
        // 개발자 모드에서 콘솔에서 answer 확인: console.log()
        console.log("answer :" + answer);

        if (answer) {
            //서버로 회원탈퇴 요청을 보냄 (get 방식)
            location.href = "member/cancelProcess.jsp";
        }
    };
</script>
</body>
</html>