<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <title>JSTL: core 예제</title>
</head>
<body>

<!-- core 태그 라이브러리 예제 목록
*** JSTL core 태그 라이브러리를 이용하기 위해서 taglib 지시자 추가
1. set태그, remove태그
2. 조건문 태그: if, choose-when-otherwise
3. 반복문 태그: forEach, forTokens
4. 페이지 이동 태그: import, redirect
5. url 태그
6. out 태그
7. catch 태그
-->

<!-- 1. set태그, remove태그 -->
<c:set var="num1" value="123" />
<c:set var="num2" value="${num1 mod 5}"/>
<c:set var="num3">500</c:set>
변수 num1: ${ num1 } <br>
변수 num2: ${ num2 } <br>
변수 num3: ${ num3 } <br>
<!-- set태그로 변수 선언 및 초기화시 scope 속성을 지정하지 않으면 기본적으로
page영역에 저장됨 -->

<!-- 참조타입의 변수 선언 및 초기화 -->
<%@ page import="human.jsp_ex.util.Data" %>
<%@ page import="human.jsp_ex.util.Person" %>
<c:set var="now" value="${ Data.getDate() }" />
현재 날짜와 시간: ${ now } <br>

<c:set var="hero" value='${ Person("이순신", 30)}'/>
<c:set var="hero2" value='${ Person("강감찬", 50)}' />
<c:set var="hero3" value='${ Person("김유신", 40)}' />
영웅의 이름과 나이 ${ hero.name }, ${ hero.age } <br>
<hr>
<!-- List 컬렉션 변수 선언 및 초기화 -->
<c:set var="heroList" value='${ Data.getPersonList(hero, hero2, hero3) }'/>
영웅의 이름과 나이: ${ heroList[0].name }, ${ heroList[0].age }<br>
영웅의 이름과 나이: ${ heroList[1].name }, ${ heroList[1].age }<br>
영웅의 이름과 나이: ${ heroList[2].name }, ${ heroList[2].age }<br>

<!-- 선언된 변수 삭제하기: remove 태그 -->
<c:remove var="hero"/>
영웅의 이름과 나이: ${ hero.name }, ${ hero.age } <br>

<hr>

<!-- 2. 조건문 태그: if, choose-when-otherwise
 - var 속성에 test 속성의 결과값을 저장할 수 있음
 - test 속성에 오는 값이 EL이 아닌 경우 false 를 반환하고
    대소문자 구분없이 true 인 경우 true 반환함
- test 속성에 오는 EL 양쪽에 공백이 있는 경우 false 를 반환함
 -->


</body>
</html>
