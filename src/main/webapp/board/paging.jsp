<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 페이지 네비게이션에서 페이지 시작번호: startPageNum -->
<c:set var="startPageNum" value="${(pageBlock-1)*pages_per_block+1}"/>

<%-- 페이지 네비게이션에서 페이지 끝번호: endPageNum--%>
<c:set var="endPageNum" value="${pageBlock*pages_per_block}"/>

<c:forEach var="i" begin="${startPageNum}" end="${endPageNum">
<c:if test="${i le totalPageNum}"> <%-- le = <= 임 --%>
    ${i}&nbsp;
</c:if>



</c:forEach>