<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>서블릿 예제: post방식 전송</title>
</head>
<body>
<form method="post" action="memberInfo" name="frm">
    이름 : <input type="text" name="name"><br>
    학년: <input type="text" name="year"><br>
    성별: <input type="radio" name="gender" value="남자" checked>남자
    <input type="radio" name="gender" value="여자" >여자<br>
    메일수신 여부:<input type="radio" name="receive_email" value="Y" checked>수신
    <input type="radio" name="receive_email" value="N">거부<br><br>
    관심분야를 선택해주세요<br>
    <input type = "checkbox" name="item" value="게임">게임
    <input type = "checkbox" name="item" value="음악감상">음악감상
    <input type="checkbox" name="item" value="잠자기">잠자기
    <input type="submit" value="post방식으로 전송">
    <hr>
    <h1>아이디 전송방식</h1>
    아이디<br>
    <input type="text" name="id"><br>
    비밀번호<br>
    <input type="password" name="pw"><br>
    이름<br>
    <input type="text" name="name2"><br>
    닉네임<br>
    <input type="text" name="nickName"><br>
    전화번호<br>
    <input type="text" name="number"><br>
    이메일<br>
    <input type="text" name="email"><br>
</form>
</body>
</html>