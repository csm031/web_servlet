<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMTP 메일보내기</title>
</head>
<body>

<h2>메일쓰기</h2>
<form action="sendEmailProcess.jsp" method="post">
    <table>
        <tr>
            <td>보내는 사람 : <input type="text" name="from" value=""></td>
        </tr>
        <tr>
            <td>받는 사람 : <input type="text" name="to" value=""></td>
        </tr>
        <tr>
            <td>제목 : <input type="text" name="subject" value=""></td>
        </tr>
        <tr>
            <td>
                형식 : 
                <input type="radio" name="format" value="text" checked>Text
                <input type="radio" name="format" value="html" >HTML
            </td>
        </tr>
        <tr>
            <td><textarea name="content" cols="60" rows="10"></textarea></td>
        </tr>
        <tr>
            <td><input type="submit" value="전송하기"></td>
        </tr>
    </table>
</form>

</body>
</html>