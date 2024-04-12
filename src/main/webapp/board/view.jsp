<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <title>글 내용</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/view.css">
</head>
<c:set var="b_idx" value="${param.b_idx}" />
<jsp:useBean id="dao" class="human.web.dao.BoardDAO"/>
<!-- 조회수 증가시키기 -->
${dao.updateRead_cnt(b_idx)}<br>
<!-- 게시글 가져오기 -->
<c:set var="dto" value="${dao.getBoard(b_idx)}" />
<body>


    <table>
        <caption>글 내용</caption>
        <tr>
            <th>작성자<br>(닉네임)</th>
            <td>
                ${dto.writer}
            </td>
        </tr>
        <tr>
            <th>제목</th>
            <td>
                ${dto.title}
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                ${dto.content}
            </td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
                <img src="${pageContext.request.contextPath}/uploads/${dto.save_filename}" width="290" height="200"><br>${dto.origin_filename}
            </td>
        </tr>
        <tr>
            <td colspan="2" id="td_btn">
                <input type="submit" value="수정하기" onclick="location.href='update.jsp?b_idx=${dto.b_idx}'">
                <input type="reset" value="삭제하기" onclick="deletePost()">
                <input type="button" value="목록보기" onclick="location.href='list.jsp'">
            </td>
        </tr>
    </table>
<script>
    deletePost=() =>{
        const ans = confirm("정말로 삭제하실건가요?");
        if (ans) {
            location.href="deleteProcess.jsp?b_idx=${dto.b_idx}"
        }
    }
</script>
</body>
</html>