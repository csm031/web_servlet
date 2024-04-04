<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String popupMode = "On";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("popupClose".equals(cookie.getName())) { //popupClose라는 이름의 쿠키가 있으면
                popupMode = cookie.getValue(); //그 쿠키의 값(off)으로 popupMode를 세팅함
            }
        }
    }
%>
<html lang="ko">
<head>
    <title>쿠키 실습: 팝업창 관리</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <style>
        #popup {
            position: absolute;
            top: 200px;
            left: 200px;
            width: 300px;
            height: 100px;
            background-color: green;
            color: yellow;
        }

        #popup > h2 {
            text-align: center;
        }

        #popup > div {
            position: relative;
            top: 0;
            padding: 10px;
            background-color: white;
            color: black;
            border: 1px solid gray;
        }

    </style>
    <!-- 자바스크립트:JQuery -->
    <script>

        //기존에 추가된 쿠키의 값을 확인하는 함수
        getCookieValue = (cookieName) => {
            let result = null; // 쿠키가 없을 경우 결과값

            let cookies = document.cookie.split(";");

            for (let cookie of cookies) {
                let trimmedCookie = cookie.trim();
                if (trimmedCookie.startsWith(cookieName + "=")) {

                    result = trimmedCookie.substring(cookieName.length + 1);

                }
            }
            return result;
        }


        $(function () {
            //popupClose 라는 쿠키의 값의 확인해서 그 값이 Off이면 팝업창을 보이지 않도록 함
            const popupCloseVal = getCookieValue("popupClose");
            if (popupCloseVal == "Off") {
                $("#popup").hide();
            }


            //팝업화면의 닫기버튼클릭 이벤트에 대한 처리
            $("#btn-close").on("click", function () {

                $("#popup").hide(); // 팝업 화면 숨김

                const chkVal = $("input:checkbox:checked").val();
                //하루 동안 열지 않음이 체크되면 1을 반환함

                //ajax를 이용해서 현재 페이지의 새로고침없이 서버로 데이터를 보내고 처리결과를 받음
                $.ajax({
                    url: "popupCookie.jsp",
                    type: "get",
                    data: {"closeOneDay": chkVal},
                    success: function (resData) {

                        if (resData.trim() !== "") {
                            location.reload(); // 현재 페이지를 새로고침해서 서버로 부터 가져온
                            //쿠키값(Off)가 화면에 출력되도록 함
                        }
                    },
                    error: function () {
                        console.log("팝업창 관리 중 에러 발생");
                    }
                });
            });
        });
    </script>
</head>
<body>

<h3>메인 페이지</h3>
<hr>

<h4>
    JSP쿠키를 이용한 팝업창 관리 예제입니다.<br>
    현재 팝업창의 모드는 <%=popupMode%> 상태입니다.
</h4>

<div id="popup">
    <h2>공지사항 팝업입니다.</h2>
    <div>
        <form name="frm_popup">
            <input type="checkbox" id="closeOneDay" value="1">하루 동안 열지 않음
            <input type="button" value="닫기" id="btn-close">
        </form>
    </div>
</div>

</body>
</html>
