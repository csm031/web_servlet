<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="human.jsp_ex.util.Conversion" %>
<%@ page import="human.jsp_ex.util.Calculator" %>

<html lang="ko">
<head>
    <title>EL 예제</title>
</head>
<body>
<!-- EL 예제 목록
1. 영역별 내장 객체에 저장된 속성 사용하기
2. 자바의 메소드 호출
3. 연산식
4. param 객체
5. header, cookie 객체
6. Map, List 객체
7. pageContext 객체

-->

<!-- 1. 영역별 내장 객체에 저장된 속성 사용하기 -->
<jsp:useBean id="dataP" class="human.jsp_ex.util.Data"/>
<jsp:setProperty name="dataP" property="name" value="홍길동P"/>

<jsp:useBean id="dataR" class="human.jsp_ex.util.Data" scope="request"/>
<jsp:setProperty name="dataR" property="name" value="홍길동R"/>

<jsp:useBean id="dataS" class="human.jsp_ex.util.Data" scope="session"/>
<jsp:setProperty name="dataS" property="name" value="홍길동S"/>

<jsp:useBean id="dataA" class="human.jsp_ex.util.Data" scope="application"/>
<jsp:setProperty name="dataA" property="name" value="홍길동A"/>

page영역에 저장된 nameP: ${ dataP.name}<br>
request영역에 저장된 nameR: ${ dataR.name}<br>
session영역에 저장된 nameS: ${ dataS.name}<br>
application영역에 저장된 nameA: ${ dataA.name}<br>

<hr>

<%
    pageContext.setAttribute("member_id", "hongP");
    request.setAttribute("member_id", "hongR");
    session.setAttribute("member_id", "hongS");
    application.setAttribute("member_id", "hongA");
%>

page영역에 저장된 member_id: ${ pageScope.member_id} <br>
request영역에 저장된 member_id: ${ requestScope.member_id} <br>
session영역에 저장된 member_id: ${ sessionScope.member_id} <br>
application영역에 저장된 member_id: ${ applicationScope.member_id} <br>

영역 지정 없이 member_id 속성을 가져오면 좁은 영역에서부터 속성을 가져옴: ${ member_id } <br>

<hr>

<!-- 2. 자바의 메소드 호출 -->

<!-- static 메소드 호출 -->
100의 제곱근: ${ Conversion.doubleToInt(Math.sqrt(100))  } <br>

<!-- 인스턴스 메소드 호출 -->
<jsp:useBean id="calc" class="human.jsp_ex.util.Calculator"/>
123 + 456 : ${calc.sum(123,456)} <br>

<hr>

<!-- 3. 연산식 -->
<!-- 산술, 비교, 논리, 조건 연산자 -->
100 + 200 : ${100+200} <br>
100 == 200 : ${100==200} <br>
(100 > 200) && (100 < 200) : ${(100 > 200) && (100 < 200)} <br>
(100 > 200)? 최대값은 100: 최대값은 200 : ${ (100==200) ? "최대값은 100" : "최대값은 200"} <br>
<hr>
<!-- 영어단어 연산자 (eq:equal, ne:not equal, gt:greater than,
 lt:less than, ge:greater than or equal, le:less than or equal) -->
100 == 200 : ${100 eq 200} <br>
(100 &gt; 200) &amp;&amp; (100 &lt; 200) : ${(100 gt 200) and (100 lt 200)} <br>
(100 &gt; 200)? 최대값은 100: 최대값은 200 : ${ (100 gt 200) ? "최대값은 100" : "최대값은 200"} <br>
<hr>
<!-- empty 연산자: null, 빈 문자열, 길이가 0인 배열, size 가 0인 컬렉션 일 때 true 반환 -->

Calculator 객체가 없으면 true : ${ empty calc } <br>
Data 객체가 있으면 true : ${ not empty dataP } <br>
<hr>
<!-- 문자열 비교: == -->
Hong과 hong이 같으면 true : ${ "Hong" == "hong" } <br>
<hr>

<!-- +기호: EL 에서는 덧셈 연산자로만 사용됨 (연결 연산자로 사용할 경우 오류 발생) -->
<%-- 아이디: hong 출력하기 위한 EL구문 테스트 : ${"아이디: " + "hong" } <br> --%>
<%--아이디: hong 출력하기 위한 EL구문 테스트 : ${ Conversion.addStr("hong") } <br>--%>

<!-- null 연산: EL에서는 null이 0으로 인식되어서 예외가 발생하지 않음-->
null + 100 : ${ null + 100 } <br>
nullStr + 100 : ${ nullStr + 100 } <br>
<hr>

<!-- 4. param 객체 -->
메일 수신 여부: ${ param.receive_email } <br>
관심분야(3개): ${ paramValues.item[0]}, ${ paramValues.item[1]}, ${ paramValues.item[2]}
<hr>

<!-- 5. header, cookie 객체 -->
서버의 호스트명: ${ header.host } <br>
사용자의 브라우저: ${ header['user-agent'] } <br>

<!-- ex03_cookie.jsp 실행 후 확인 -->
쿠키 전체 내용: ${ header.cookie } <br>
pid 쿠키 값: ${ cookie.pid.value } <br>
<hr>

<!-- 6. Map, List 객체 -->
<%@ page import="java.util.*, human.jsp_ex.util.Person" %>
<!--
(배열 : 1개의 데이터형, 고정된 크기, 연속적인 저장공간,
 인덱스를 이용한 배열 요소 접근, 중복된 값을 저장 가능)
10개의 정수를 저장할 수 있는 배열 nums를 정의하시오.
int[] nums = new int[10];

(컬렉션(Collection): 여러 개의 데이터형, 가변적인 크기)
-Set: 순서가 없음, 중복된 값을 허용하지 않음
-List: 순서가 있음, 중복된 값을 허용함
-Map: (key, value)의 쌍으로 값을 저장함, key를 이용해서 value 사용 - HashMap클래스
-->

<%
    List<Person> heroList = new ArrayList<>();
    heroList.add(new Person("이순신", 30));
    heroList.add(new Person("강감찬", 50));
// 제네릭을 적용하지 않은 경우: 업캐스팅되어서 저장된 데이터를 다운캐스팅해서 사용해야 하는 불편함 발생
//    String p1 = (String) heroList.get(0).getName();
//    제네릭을 적용한 경우: 정해진 데이터형으로 데이터가 컬렉션에 저장되고 가지고 올 때도 정해진 데이터형으로
//    가져올 수 있기 때문에 참조형변환(업캐스팅,다운캐스팅)이 필요 없어짐
//    제네릭의 형식: 컬렉션 타입<데이터형>
//    String p1Name = heroList.get(0).getName();

    pageContext.setAttribute("heroList", heroList);

    HashMap<String, String> langMap = new HashMap<>();
    langMap.put("Kor", "Korean");
    langMap.put("Eng", "English");

    pageContext.setAttribute("langMap", langMap);

%>
한국어: ${ langMap.Kor } <br>
영어: ${ langMap['Eng'] } <br>
영웅 리스트<br>
이름: ${ heroList[0].name }, 나이: ${ heroList[0].age } <br>
이름: ${ heroList[1].name }, 나이: ${ heroList[1].age } <br>

<hr>

<!-- 7. pageContext 객체 -->
요청 URI: ${ pageContext.request.requestURI } <br>
요청 URL: ${ pageContext.request.requestURL } <br>
컨텍스트 경로: ${ pageContext.request.contextPath } <br>
</body>
</html>