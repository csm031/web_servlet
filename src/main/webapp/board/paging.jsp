<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 페이지 네비게이션에서 페이지 시작번호: startPageNum -->
<c:set var="startPageNum" value="${(pageBlock-1)*pages_per_block+1}"/>

<!-- 페이지 네비게이션에서 페이지 끝번호: endPageNum-->
<c:set var="endPageNum" value="${pageBlock*pages_per_block}"/>



<!-- 검색어가 있는 경우와 검색어가 없는 경우로 페이징 처리 구분하기:searchDto -->
<c:choose>
    <c:when test="${not empty searchDto.searchWord}">
        <!-- 검색어가 있는 경우 -->
        <!-- 첫번째 페이지 표시와 이전 페이지 출력하기 -->
        <c:if test="${pageNum>pages_per_block}">
            <a href="list.jsp?pageNum=1&pageBlock=1&searchField=${searchDto.searchField}&searchWord=${searchDto.searchWord}"><<</a>
            &nbsp;
            <a href="list.jsp?pageNum=${(pageBlock-2)*pages_per_block + 1}&pageBlock=${pageBlock-1}&searchField=${searchDto.searchField}&searchWord=${searchDto.searchWord}">
                < 이전페이지</a>
        </c:if>
        <c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
            <!-- 페이지 번호가 전체 페이지번호보다 작거나 같은 경우에만 출력되도록 조건문으로 처리함 -->
            <c:if test="${i le totalPageNum}"> <%-- le = <= 임 --%>

                <!-- 현재 페이지번호의 색깔을 다른 색깔로 출력하기: 빨간색  -->
                <c:choose>
                    <c:when test="${pageNum eq i}">
                        <a href="list.jsp?pageNum=${i}&pageLBlock=${pageBlock}&searchField=${searchDto.searchField}&searchWord=${searchDto.searchWord}">
                            <span style="color: red">${i}</span></a>
                    </c:when>
                    <c:otherwise>
                        <a href="list.jsp?pageNum=${i}&pageLBlock=${pageBlock}&searchField=${searchDto.searchField}&searchWord=${searchDto.searchWord}">${i}&nbsp;</a>
                    </c:otherwise>
                </c:choose>


            </c:if>


        </c:forEach>

        <!-- 다음페이지와 마지막 페이지 표시 출력하기 -->
        <%--
        < =lt
        != = ne
        --%>
        <c:if test="${ ((rows_per_page*pages_per_block) lt totalRows) and (pageBlock ne lastPageBlock)}">
            <a href="list.jsp?pageNum=${pageBlock*pages_per_block+1}&pageBlock=${pageBlock+1}&searchField=${searchDto.searchField}&searchWord=${searchDto.searchWord}">다음페이지&gt;</a>
            &nbsp;
            <a href="list.jsp?pageNum=${totalPageNum}&pageBlock=${lastPageBlock}&searchField=${searchDto.searchField}&searchWord=${searchDto.searchWord}">>></a>
        </c:if>
    </c:when>
    <c:otherwise>
        <!--검색어가 없는 경우-->
        <!-- 첫번째 페이지 표시와 이전 페이지 출력하기 -->
        <c:if test="${pageNum>pages_per_block}">
            <a href="list.jsp?pageNum=1&pageBlock=1&searchField=${searchDto.searchField}&searchWord=${searchDto.searchWord}"><<</a>
            &nbsp;
            <a href="list.jsp?pageNum=${(pageBlock-2)*pages_per_block + 1}&pageBlock=${pageBlock-1}&searchField=${searchDto.searchField}&searchWord=${searchDto.searchWord}">
                < 이전페이지</a>
        </c:if>
        <c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
            <!-- 페이지 번호가 전체 페이지번호보다 작거나 같은 경우에만 출력되도록 조건문으로 처리함 -->
            <c:if test="${i le totalPageNum}"> <%-- le = <= 임 --%>

                <!-- 현재 페이지번호의 색깔을 다른 색깔로 출력하기: 빨간색  -->
                <c:choose>
                    <c:when test="${pageNum eq i}">
                        <a href="list.jsp?pageNum=${i}&pageLBlock=${pageBlock}">
                            <span style="color: red">${i}</span></a>
                    </c:when>
                    <c:otherwise>
                        <a href="list.jsp?pageNum=${i}&pageLBlock=${pageBlock}">${i}</a>
                    </c:otherwise>
                </c:choose>


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
            <a href="list.jsp?pageNum=${totalPageNum}&pageBlock=${lastPageBlock}">>></a>
        </c:if>



    </c:otherwise>
</c:choose>


