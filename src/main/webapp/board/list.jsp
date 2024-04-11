<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <title>글 목록</title>
</head>
<body>

<!-- 게시물 목록 가져오기:boardList -->
<jsp:useBean id="dao" class="human.web.dao.BoardDAO"/>

<!-- 사용자가 입력한 검색조건을 저장할 searchDTO 생성 -->
<jsp:useBean id="searchDto" class="human.web.dto.SearchDTO"/>
<jsp:setProperty name="searchDto" property="*"/>

<!-- 검색조건을 포함해서 게시글 목록 가져오기 -->
<c:set var="boardList" value="${dao.getBoardList(searchDto)}"/>

<!-- 검색 폼 -->
<form>
    <table>
        <caption> 글 목록 </caption>
        <tr>
            <td>총 게시물:</td>
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
                <input type="submit" value="검색">
            </td>
        </tr>
    </table>
</form>

<!-- 글목록 테이블 -->
<table>
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
                <td colspan="6"> 등록된 게시물이 없습니다. </td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach var="board" items="${boardList}" varStatus="status"/>
            <tr>
                <td><%-- 번호 --%>
                    ${status.count}
                </td>
                <td><%-- 제목 --%>
                    ${board.title}
                </td>
                <td><%-- 작성자 --%>
                    ${board.writer}
                </td>
                <td><%-- 조회수 --%>
                    ${board.read_cnt}
                </td>
                <td><%-- 등록일 --%>
                    ${board.post_date}
                </td>
                <td><%-- 첨부 --%>
                    <%-- 첨부파일이 있을 경우 첨부파일 이미지를 출력되도록 함 --%>
                    <c:if test="${not empty board.origin_filename}">
                        <img src="${pageContext.request.contextPath}/resources/img/download.png" width="15px" height="17px" alt="이미지1">
                    </c:if>
                </td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>
</body>
</html>
