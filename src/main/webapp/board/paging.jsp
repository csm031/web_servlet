<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 페이지 네비게이션에서 페이지 시작번호: startPageNum -->
<c:set var="startPageNum" value="${(pageBlock-1)*pages_per_block+1}"/>

<!-- 페이지 네비게이션에서 페이지 끝번호: endPageNum-->
<c:set var="endPageNum" value="${pageBlock*pages_per_block}"/>

<!-- 첫번째 페이지 표시와 이전 페이지 출력하기 -->
<c:if test="${pageNum>pages_per_block}">
 <a href="list.jsp?pageNum=1&pageBlock=1">&lt;&lt;</a>
    &nbsp;
    <a href="list.jsp?pageNum=${(pageBlock-2)*pages_per_block + 1}&pageBlock=${pageBlock-1}">
        &lt; 이전페이지</a>
</c:if>

<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
    <!-- 페이지 번호가 전체 페이지번호보다 작거나 같은 경우에만 출력되도록 조건문으로 처리함 -->
    <c:if test="${i le totalPageNum}"> <%-- le = <= 임 --%>
        <a href="list.jsp?pageNum=${i}&pageLBlock=${pageBlock}">${i}&nbsp;</a>
    </c:if>


</c:forEach>

<!-- 다음페이지와 마지막 페이지 표시 출력하기 -->
<%--
< =lt
!= = ne
--%>
<c:if test="${ ((rows_per_page*pages_per_block) lt totalRows) and (pageBlock ne lastPageBlock)}">
    <a href="list.jsp?pageNum=${pageBlock*pages_per_block+1}&pageBlock=${pageBlock+1}">다음페이지&gt;</a>
    &nbsp;
    <a href="list.jsp?pageNum=${totalPageNum}&pageBlock=${lastPageBlock}">&gt;&gt;</a>
</c:if>