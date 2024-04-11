<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="human.web.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %></>

<jsp:useBean id="dto" class="human.web.dto.MemberDTO"/>
<jsp:useBean id="dao" class="human.web.dao.MemberDAO"/>
<jsp:setProperty name="dto" property="*"/>
<!--회원 정보 변경 처리 -->
<c:set var="result" value="${dao.update(dto)}"/>
<c:choose>
    <c:when test="${result eq 1}">

        <%-- 기존에 저장된 member라는 이름으로 저장되어 있던 dto객체를 삭제함 --%>
        <c:remove var="member" scope="session"/>

        <%-- 새로운 dto객체를 member라는 이름으로 session객체에 저장함 --%>
        <c:set var="member" value="${dao.getMember(dto.m_idx)}" scope="session"/>

        <%--메인 페이지를 새로 요청하기--%>
        <c:redirect url="../index.jsp"/>
    </c:when>
    <c:otherwise>

        <%-- 3. forward액션태그 이용--%>
        <jsp:forward page="update.jsp">
            <jsp:param name="msg" value="시스템의 문제로 회원정보 변경이 이루어지지 않았습니다. 빠른 시일 내에 시스템을 정상화하겠습니다"/>
        </jsp:forward>

    </c:otherwise>
</c:choose>