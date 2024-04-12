<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="ko">
  <head>
    <title>글 수정</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/update.css">
      <c:set var="b_idx" value="${param.b_idx}" />
      <jsp:useBean id="dao" class="human.web.dao.BoardDAO"/>
      <!-- 게시글 가져오기 -->
      <c:set var="dto" value="${dao.getBoard(b_idx)}" />
  </head>
  <body>

  <form name="frm_update" action="updateProcess.jsp" method="post" enctype="multipart/form-data">
      <table>
          <caption>글 수정</caption>
          <tr>
              <th>작성자(닉네임)</th>
              <td>
                  <input type="text" value="${dto.writer}" disabled>
                  <input type="hidden" value="${dto.writer}">
                  <input type="hidden" name="m_idx" value="${dto.m_idx}">
                  <input type="hidden" name="b_idx" value="${dto.b_idx}">
              </td>
          </tr>
          <tr>
              <th>제목</th>
              <td>
                  <input type="text" value="${dto.title}" name="title">
              </td>
          </tr>
          <tr>
              <th>내용</th>
              <td>
                  <textarea rows="10" cols="30" name="content" >${dto.content}</textarea>
              </td>
          </tr>
          <tr>
              <th>첨부파일</th>
              <td>
                  <input type="file" name="uploadFile">
                  <span id="file_msg">새로운 파일을 선택하면 이전 파일이 교체됩니다.</span>
                  ${dto.save_filename}
              </td>
          </tr>
          <tr>
              <td colspan="2">
                  <input type="submit" value="작성완료">
                  <input type="reset" value="다시입력">
                  <input type="button" value="목록보기" onclick="location.href='list.jsp'">
              </td>
          </tr>
      </table>
  </form>
  </body>
</html>
