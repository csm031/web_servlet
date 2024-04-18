<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <style>
        input {
            width: 200px;
            height: 30px;
            line-height: 30px;
            padding: 5px;
            margin: 5px;
        }

        input[type=submit] {
            width: 210px;
            height: 50px;
            margin-top: 20px;
        }

        input[type=checkbox] {
            width: 11px;
            height: 11px;
        }

        #div-save-id {
            display: inline-block;
            height: 20px;
            line-height: 20px;
            margin-left: 5px;
            font: 14px Arial, SansSerif;
        }
    </style>

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(function () {
            //아이디 저장하기 체크박스가 체크되었다가 해제되었을 때 mid 쿠키를 삭제함
            $("input:checkbox:checked").on("change", function () {
                //쿠키 삭제하기
                document.cookie = "mid =; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/;";
                //현재 페이지를 새로고침해야 쿠키 삭제가 적용됨
                location.reload();
            });
        })
    </script>
</head>
<body>
<h3>로그인</h3>
<hr>
<form method="post" action="loginProcess.jsp" name="frm_Login">
<%-- 쿠키를 확인해서 mid가 있으면 아이디에 값을 넣어주고 아이디 저장하기 체크박스를 체크해줌 --%>
<c:choose>
    <c:when test="${ not empty cookie.mid }">
        <input type="text" name="member_id" value="${cookie.mid.value}"> <br>
        <input type="password" name="member_pw" placeholder="비밀번호"> <br>
        <input type="submit" value="로그인"><br>
        <div id="div-save-id">
            <input type="checkbox" name="save_id" value="Y" checked>아이디 저장하기
        </div>
    </c:when>
    <c:otherwise>
            <input type="text" name="member_id" placeholder="아이디"> <br>
            <input type="password" name="member_pw" placeholder="비밀번호"> <br>
            <input type="submit" value="로그인"><br>
            <div id="div-save-id">
                <label>
                    <input type="checkbox" name="save_id" value="Y">
                    아이디 저장하기
                </label>
            </div>
        </form>
    </c:otherwise>
</c:choose>
<%-- 로그인 실패 메시지 --%>
<p>${not empty param.msg ? param.msg : " "}</p>
</body>
</html>
