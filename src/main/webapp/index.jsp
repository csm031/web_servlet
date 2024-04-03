<%@ page import="human.web.member.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="ko">
<head>
    <title>메인페이지</title>
</head>
<body>
<h3>메인페이지</h3>
<hr>
<%
    //JSP페이지에서 자바 소스를 사용해서 작업할 때 사용되는 스크리브 요소 중 하나: 스크립트릿

    //JSP에서는 session객체를 별도로 가져올 필요없이 내장객체로 지원되는 session객체를 이용할 수 있음
    //JAVA 클래스는 page지시자의 import속성을 이용해서 처리함
    MemberDTO dto = (MemberDTO) session.getAttribute("member");

    //회원인 경우 dto가 null이 아님
    if (dto != null) {
%>
<!-- 회원에게 보여지는 화면 -->
<%= dto.getNickname()%>님 환영합니다.<br> <!--JSP페이지에서 자바소스 코드의 값을 출력하는데 사용되는 스크립트 요소: 표현식 -->
<a href="member/update.jsp">회원정보변경</a><br>
<!-- 로그아웃은 별도의 화면을 필요로 하지 않기 때문에 바로 서버에 URL로 로그아웃 요청함 (get 방식)-->
<a href="member/memberLogOut">로그아웃</a><br>

<a href="javascript:cancel();">회원탈퇴</a>
<%
    //회원정보 탈퇴 실패 시 메시지 출력
    String msg = null;
    msg = (String) request.getAttribute("msg");
    if (msg != null) {
        out.println("<p>" + msg + "</p>");
    }
} else { //비회원인 경우
%>
<!--비회원에게 보여지는 화면-->
<a href="member/join.jsp">회원가입</a><br>
<a href="member/login.jsp">로그인</a><br>

<%
    }
%>

<script>
    cancel = () => {    // 회원 탈퇴에 대한 처리 함수
                        // confirm 창에 확인을 클릭하면 true, 취소를 클릭하면 false 반환
        const answer = confirm("정말 회원탈퇴를 하시겠습니까?")
        // 개발자 모드에서 콘솔에서 answer 확인: console.log()
        console.log("answer :" + answer);

        if (answer) {
            //서버로 회원탈퇴 요청을 보냄 (get 방식)
            location.href = "member/memberCancel";
        }
    };
</script>
</body>
</html>
