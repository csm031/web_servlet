<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="human.web.member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!--JSP페이지에서 전달된 아이디와 비밀번호 가져오기-->
<c:set var="member_id" value="${param.member_id}"/>
<c:set var="member_pw" value="${param.member_pw}"/>

<!--MemberDAO를 이용해서 로그인 처리하기-->
<jsp:useBean id="dao" class="human.web.member.MemberDAO"/>

<c:set var="result" value="${dao.login(member_id,member_pw)}"/>

<!--//로그인이 정상적으로 이루어진 경우 session객체에 회원정보를 저장해서 메인페이지로 이동하고
로그인이 실패한 경우 "아이디나 비밀번호가 일치하지 않습니다"를 request객체에 저장해서 로그인페이지로
이동하도록 함-->
<c:choose>
    <c:when test="${result eq 1}">
        <c:set var="member" value="${dao.getMember(member_id)}" scope="session"/>
        <c:redirect url="../index.jsp"/>
    </c:when>
    <c:otherwise>
       <c:set var="msg" value="아이디나 비밀번호가 일치하지 않습니다" scope="session"/>
        <c:redirect url="login.jsp"/>
    </c:otherwise>
</c:choose>