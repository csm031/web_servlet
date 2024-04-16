<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <title>정규표현식 연습</title>
    <script>

        const str1 = "AAaaBBbbAa1*";
        const regexp1 = /A{2,3}/i; //A나 a가 2-3개 이어져 있는 문자열
        console.log("str1 검증결과: " + regexp1.test(str1));

        const str2 = "AAaaBBbbbAa1*";
        const regexp2 = /A{2}/; //A가2개 이어져 있는 문자열
        console.log("str2 검증결과: " + regexp2.test(str2));

        const str3 = "AaaB홓BbbbAa1*";
        const regexp3 = /[가-힣]/; //한글이 있는 문자열
        console.log("str3 검증결과: " + regexp3.test(str3));

        const str4 = "~!@#$%^&*()_+1";
        const regexp4 = /[A-Za-z0-9가-힣]/; //영어대소문자, 숫자, 한글이 있는 문자열
        console.log("str4 검증결과: " + regexp4.test(str4));

        const str5 = "AaaBBBbbbcAa1*";
        const regexp5 = /c+/i; //대소문자를 구분하지 않고 c가 1개 이상 있는 문자열
        console.log("str5 검증결과: " + regexp5.test(str5));

        const str6 = "12345a";
        const regexp6 = /[^0-9]/; //숫자가 아닌 문자가 있는 문자열
        console.log("str6 검증결과: " + regexp6.test(str6));

        const str7 = "https가나다";
        const regexp7 = /^https/; //https로 시작하는 문자열
        console.log("str7 검증결과: " + regexp7.test(str7));

        const str8 = "www.naver.com";
        const regexp8 = /com$/; //com으로 끝나는 문자열
        console.log("str8 검증결과: " + regexp8.test(str8));

        const str9 = "www.naver.com3";
        const regexp9 = /(?=.*[0-9])/; //앞에 어떤 문자가 몇개가 오든 숫자가 있는 문자열이면 조건만족
        console.log("str9 검증결과: " + regexp9.test(str9));

        const str10 = "https://www.naver.com";
        const regexp10 = /((^https)([A-Za-z0-9./:])+)(com$)/; //앞에 어떤 문자가 몇개가 오든 숫자가 있는 문자열이면 조건만족
        console.log("str10 검증결과: " + regexp10.test(str10));

//숫자 1개 이상을 포함하고 8글자 이상 10글자 이하인 문자열에 대한 정규표현식
        const str11 = "1qwer5as33d";
        const regexp11 = /(?=.*[0-9])[0-9A-Za-z~!@#$%^&*()|=]{8,10}$/
        /*  /(?=.*[0-9])[0-9A-Za-z~!@#$%^&*()|=]{8,10}$/  */
        console.log("str11 검증결과: " + regexp11.test(str11));

//비밀번호는 8글자 이상 16글자 이하로 영문자, 숫자, 특수문자를 1개 이상 포함해야 합니다.
//위 조건을 체크할 수 있는 정규표현식을 작성하시오.
        const str12 = "12345678#e";
        const regexp12 = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()|=])[0-9A-Za-z~!@#$%^&*()|=]{8,16}$/
        console.log("str12 검증결과: " + regexp12.test(str12));

//전화번호는 010-숫자4자리-숫자4자리로 입력해야 합니다.
// 위 조건을 체크할 수 있는 정규표현식을 작성하시오.
        const regexp13 = /^010-\d{4}-\d{4}$/;
        const str13 = "010-1111-2312"
        console.log("str13 검증결과: " + regexp13.test(str13));
    </script>
</head>
<body>
<h3>정규표현식 연습</h3>
</body>
</html>
