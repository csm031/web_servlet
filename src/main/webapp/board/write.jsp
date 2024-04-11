<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
  <head>
    <title>글등록</title>
  </head>
  <body>

  <form name="frm_write" action="writeProcess.jsp" method="post" enctype="multipart/form-data">
      <table border="1">
          <caption>글 등록</caption>
          <tr>
              <th>작성자(닉네임)</th>
              <td>
                  <input type="text" value="${member.nikename}" disabled>
                  <input type="hidden" name="writer" value="${member.nikename}">
                  <input type="hidden" name="m_idx" value="${member.m_idx}">
              </td>
          </tr>
          <tr>
              <th>제목</th>
              <td>
                  <input type="text" name="title">
              </td>
          </tr>
          <tr>
              <th>내용</th>
              <td>
                  <textarea rows="10" cols="30" name="content"></textarea>
              </td>
          </tr>
          <tr>
              <th>첨부파일</th>
              <td>
                  <input type="file" name="uploadFile">
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
