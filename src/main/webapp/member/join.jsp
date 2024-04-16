<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js">
        $(document).ready(function () {
            let frm_join = document.forms['frm_join'];

            //아이디 중복검사
            $("#check_id").on("click", function () {
                let member_id = $("#member_id").val();

                if (member_id.length === 0) {
                    alert("아이디가 입력되지 않았습니다.")
                    frm_join.member_id.focus();
                } else {
                    $.ajax({
                        type: "post",
                        url: "checkId.jsp",
                        data: {"member_id": member_id},
                        success: function (resData) {
                            const resChkId = $("#result_checkId");
                            resChkId.show();//중복검사 결과를 띄우는 div를 보이게 함

                            //유의: 응답내용에서 공백을 제거해줘야 정상적인 결과값을 얻어서 처리할 수 있음: trim()
                            if (resData.trim() === "PASS") {
                                resChkId.html("사용 가능한 아이디입니다.").css("color", "green");
                            } else {
                                resChkId.html("이미 사용중인 아이디입니다.").css("color", "red");
                                $("member_id").val("").trigger("focus");// focus 이벤트 강제로 발생시킴
                            }
                        },
                        error : function (error) {
                            console.log("아이디 중복검사 중 에러 발생");
                        }
                    }) //end of ajax
                }
            })// end of click

            // 회원가입 정보에 대한 유효성 검사
            frm_join.addEventListener("submit", function (e) {

                // 이벤트의 기본동작을 막기위한 변수 선언
                let valid = false;

                //비밀번호와 전화번호에 대한 정규표현식
                const regexp_pw = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[~!@#$%^&*()=|+]){8,10}/;
                const regexp_phone = /^010-\d{4}-\d{4}$/;
                //각각의 입력란에 대한 입력값 확인
                if (frm_join.member_id.value.length === 0) {
                    alert("아이디가 입력되지 않았습니다.");
                    frm_join.member_id.focus();
                } else if (frm_join.member_pw.value.length === 0) {
                    alert("비밀번호가 입력되지 않았습니다.");
                    frm_join.member_pw.focus();
                } else if (!regexp_pw.test(frm_join.member_pw.value)) {
                    alert("비밀번호는 8글자 이상 16글자 이하로 영문자, 숫자, 특수문자를 1개이상 포함해야합니다.");
                    frm_join.member_pw.focus();
                } else if (frm_join.member_name.value.length === 0) {
                    alert("이름이 입력되지 않았습니다.");
                    frm_join.member_name.focus();
                } else if (frm_join.nickname.value.length === 0) {
                    alert("닉네임이 입력되지 않았습니다.");
                    frm_join.nickname.focus();
                } else if (frm_join.handphone.value.length === 0) {
                    alert("전화번호가 입력되지 않았습니다.");
                    frm_join.handphone.focus();
                } else if (!regexp_phone.test(frm_join.handphone.value)) {
                    alert("전화번호 입력양식이 잘못되었습니다.");
                    frm_join.handphone.focus();
                } else if (frm_join.email.value.length === 0) {
                    alert("이메일이 입력되지 않았습니다.");
                    frm_join.email.focus();
                } else { // 유효성 검사를 통과한 경우
                    valid = true;
                }
                if (!valid) { // 유효성검사를 통과하지 못한 경우
                    e.preventDefault();//이벤트의 기본동작 막음
                    e.stopPropagation();//이벤트의 전파 막음
                }
            })
        })
    </script>
    <style>
        input {
            width: 200px;
            height: 30px;
            line-height: 30px;
            padding: 5px;
            margin: 5px;
        }

        input [type=submit] {
            width: 100px;
            height: 50px;
            margin-top: 20px;
        }

        #check_id {
            width: 50px;
            height: 40px;
            border: 1px solid;
            border-radius: 10px;
            border-color: gray;
            font-size: 10px;
            background-color: white;
        }

        #result_checkId {
            display: none;
            padding-left: 10px;
            font: 12px Arial, SansSerif
        }
    </style>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
<h3>회원가입</h3>
<hr>
<form method="post" action="joinProcess.jsp" name="frm_join">
    <input type="text" name="member_id" id="member_id" placeholder="아이디">
    <input type="button" id="check_id" value="중복검사">
    <br>
    <input type="password" name="member_pw" placeholder="비밀번호"><br>
    <input type="text" name="member_name" placeholder="이름"><br>
    <input type="text" name="nickname" placeholder="닉네임"><br>
    <input type="text" name="handphone" placeholder="핸드폰번호"><br>
    <input type="text" name="email" placeholder="이메일"><br>
    <input type="submit" value="가입하기">
    <input type="button" value="취소하기" onclick="location.href='../index.jsp'">
</form>

</body>
</html>