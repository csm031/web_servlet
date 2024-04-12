<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="human.web.util.Conversion" %>
<html lang="ko">
<head>
    <title>글 목록</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css">
</head>
<body>

<!-- 게시물 목록 가져오기:boardList -->
<jsp:useBean id="dao" class="human.web.dao.BoardDAO"/>

<!-- 사용자가 입력한 검색조건을 저장할 searchDTO 생성 -->
<jsp:useBean id="searchDto" class="human.web.dto.SearchDTO"/>
<jsp:setProperty name="searchDto" property="*"/>

<!-- 검색조건을 포함해서 게시글 목록 가져오기 -->
<c:set var="boardList" value="${dao.getBoardList(searchDto)}"/>

<!-- =============================== 게시글 목록 페이징 관련 변수 정의(시작) =============================== -->

<!--
1. 총 레코드 수: totalRows
2. 페이지당 테이블에 출력할 게시물 수: rows_per_page
3. 페이지 네비게이션에서 블록당 페이지 수: pages_per_block
4. 페이지 네비게이션에서 현재 페이지 번호: pageNum
5. 테이블에 표시할 시작번호: startNum
6. 테이블에 표시할 끝번호: endNum
7. 페이지 네비게이션에서 전체 페이지번호 수: totalPageNum
8. 페이지 네비게이션에서 현재 페이지 블록: pageBlock
9. 페이지 네비게이션에서 마지막 페이지 블록: lastPageBlock
-->

<!-- 1. 총 레코드 수: totalRows -->
<c:set var="totalRows" value="${dao.getTotalRows(searchDto)}"/>

<!-- 2. 페이지당 테이블에 출력할 게시물 수: rows_per_page -->
<c:set var="rows_per_page" value="10"/>

<!-- 3.페이지 네비게이션에서 블록당 페이지 수: pages_per_block -->
<c:set var="pages_per_block" value="5"/>

<!-- 4. 페이지 네비게이션에서 현재 페이지 번호: pageNum -->
<c:set var="pageNum" value="${param.pageNum}}"/>
<c:if test="${empty PageNum}">
    <c:set var="pageNum" value="1"/>
</c:if>

<!-- 5. 테이블에 표시할 시작번호: startNum -->
<!-- 페이지번호가 1일 때 (1-1)*10+1 = 1
    페이지 번호가 2일 때 (2-1)*10+1 = 11
-->
<c:set var="startNum" value="${(pageNum-1)*rows_per_page +1}"/>

<!-- 6. 테이블에 표시할 끝번호: endNum -->
<c:set var="endNum" value="${pageNum*rows_per_page}"/>

<!-- 7. 페이지 네비게이션에서 전체 페이지번호 수: totalPageNum -->
<!-- Math.ceil()메소드로 계산 결과를 올림처리해주고 Converson.doubleToInt()메소드로 double 값을
    int 값으로 변경해줌 page 지시자에 import="human.web.util.Conversion"추가해줌 -->
<c:set var="totalPageNum"
       value="${ Conversion.doubleToInt(Math.ceil(totalRows/rows_per_page)) }"/>

<!-- 8. 페이지 네비게이션에서 현재 페이지 블록: pageBlock -->
<c:set var="pageBlock" value="${param.pageBlock}"/>
<c:if test="${empty pageBlock}">
    <c:set var="pageBlock" value="1"/>
</c:if>

<!-- 9. 페이지 네비게이션에서 마지막 페이지 블록: lastPageBlock -->
<c:set var="lastPageBlock" value="${ Conversion.doubleToInt(Math.ceil(totalPageNum/pages_per_block)) }"/>


<!-- ========================== 게시글 목록 페이징 관련 변수 정의(끝) ========================-->
<!-- 검색 폼 -->
<form>
    <table>
        <caption> 글 목록</caption>
        <tr>
            <td id="td_title">총 게시물: ${totalRows}</td>
            <td>
                <label>
                    <select name="searchField">
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                        <option value="writer">작성자</option>
                    </select>
                </label>
                <label>
                    <input type="text" name="searchWord">
                </label>
                <input type="submit" value="검색" id="search_btn">
            </td>
        </tr>
    </table>
</form>

<!-- 글목록 테이블 -->
<table id="tbl_list">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>등록일</th>
        <th>첨부</th>
    </tr>

    <!-- 글 목록 내용 -->
    <c:choose>
        <c:when test="${empty boardList}">
            <tr>
                <td colspan="6"> 등록된 게시물이 없습니다.</td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach var="rowNum" begin="${startNum}" end="${endNum}" varStatus="status">
                <%-- boardList에 저장된 게시물(BoardDTO)이 있는 경우에만 테이블 행 출력하기 --%>
                <c:if test="${not empty boardList[rowNum-1]}">
                    <tr>
                        <td><%-- 번호 --%>
                                ${rowNum}
                        </td>
                        <td><%-- 제목 --%>
                            <a href="view.jsp?b_idx=${boardList[rowNum-1].b_idx}">${boardList[rowNum-1].title}</a>
                        </td>
                        <td><%-- 작성자 --%>
                                ${boardList[rowNum-1].writer}
                        </td>
                        <td><%-- 조회수 --%>
                                ${boardList[rowNum-1].read_cnt}
                        </td>
                        <td><%-- 등록일 --%>
                                ${boardList[rowNum-1].post_date}
                        </td>
                        <td><%-- 첨부 --%>
                                <%-- 첨부파일이 있을 경우 첨부파일 이미지를 출력되도록 함 --%>
                            <c:if test="${not empty boardList[rowNum-1].origin_filename}">
                                <img id="imgs" src="${pageContext.request.contextPath}/resources/img/download.png"
                                     width="20px" height="20px" alt="이미지1">
                            </c:if>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </c:otherwise>
    </c:choose>

    <!-- 회원인 경우 하단에 글쓰기 버튼 구현 -->
    <c:if test="${not empty memebr}">
        <tr>
            <td id="td_write_btn" colspan="6">
                <a href="write.jsp"><input type="button" id="write_btn" value="글쓰기"></a>
            </td>
        </tr>
    </c:if>

    <!-- 게시글이 있는 경우 하단에 페이지 네비게이션 구현 -->
    <c:if test="${not empty boardList}">
        <tr>
            <td id="td_paging" colspan="6">
                <%-- 페이지 네비게이션 구현 JSP페이지 포함시키기 --%>
                <%@ include file="paging.jsp" %>
            </td>
        </tr>
    </c:if>
</table>
</body>
</html>
