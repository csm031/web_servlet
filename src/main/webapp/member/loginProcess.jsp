<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="human.web.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="human.web.common.CookieManager" %>

<!--JSP페이지에서 전달된 아이디와 비밀번호 가져오기-->
<c:set var="member_id" value="${param.member_id}"/>
<c:set var="member_pw" value="${param.member_pw}"/>

<%-- 아이디 저장하기에 대한 값 변수로 정의: 로그인 페이지에서 체크박스를 체크하지 않으면 null 반환, 체크하면 Y반환 --%>
<c:set var="save_id" value="${param.save_id}"/>

<!--MemberDAO를 이용해서 로그인 처리하기-->
<jsp:useBean id="dao" class="human.web.dao.MemberDAO"/>

<c:set var="result" value="${dao.login(member_id,member_pw)}"/>

<!--//로그인이 정상적으로 이루어진 경우 session객체에 회원정보를 저장해서 메인페이지로 이동하고
로그인이 실패한 경우 "아이디나 비밀번호가 일치하지 않습니다"를 request객체에 저장해서 로그인페이지로
이동하도록 함-->
<c:choose>
    <c:when test="${result eq 1}">
        <c:set var="member" value="${dao.getMember(member_id)}" scope="session"/>
        <%-- 아이디 저장하기에 체크가 되었고 EL의 cookie 내장객체로 mid를 확인해서 없으면
        CookieManager 클래스의 makeCookie()메소드를 이용해서 쿠키를 생성하고 response 객체에 추가해줌.
          쿠키이름: mid, 쿠키값: member_id, 유효기간: 60*2(2분) --%>
        <c:if test="${(save_id == 'Y') and (empty cookie.mid)}">
            ${ CookieManager.makeCookie(pageContext.response, "mid", member_id, 120)} <br>
        </c:if>
        <c:redirect url="../index.jsp"/>
    </c:when>
    <c:otherwise>
        <%-- 3. forward 액션태그 이용--%>
        <%-- request영역에 속성으로 값을 저장하는 것 대신에 param 액션태그를 이용해서 parameter로 request 객체에 값을 저장--%>
        <jsp:forward page="login.jsp">
            <jsp:param name="msg" value="아이디나 비밀번호가 일치하지 않습니다"/>
        </jsp:forward>
    </c:otherwise>
</c:choose>