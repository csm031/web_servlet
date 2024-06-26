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

<!-- 홀수 짝수 판단하기 -->
<c:if test="${ 123 mod 2 eq 0}" var="result">
    123은 짝수이다. <br>
</c:if>
<c:if test="${ not reslut }">
    123은 홀수이다. <br>
</c:if>

<c:if test="100" var ="result2"/>
<c:if test=" ${true} " var="result3"/>
test 속성에 EL이 아닌 값이 오는 경우 결과값: ${result2} <br>
test 속성에 오는 EL 양쪽에 공백이 있는 경우 결과값: ${result3} <br>

<!-- 조건문: choose - when - otherwise -->
<!-- 검색어가 있는 경우와 검색어가 없는 경우 -->
<!-- 검색 폼 -->
<div>
    <form><!-- action 속성이 없으면 현재 JSP 페이지를 호출하여 입력값을 보냄 -->
        <select name="searchField">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="writer">작성자</option>
        </select>
        <input type="text" name="searchWord" id="searchWord">
        <input type="submit" name="search_btn" value="검색">
    </form>
</div>

<c:choose>
    <c:when test="${not empty param.searchWord }">
        검색영역: ${param.searchField}, 검색어: ${param.searchWord} <br>
    </c:when>
    <c:otherwise>
        검색어가 없습니다. <br>
    </c:otherwise>
</c:choose>

<hr>

<!-- 3. 반복문 태그: forEach, forTokens
- forEach 태그: 일반 for문, forEach문 모두 지원
- forEach의 varStatus속성: 제어변수 var의 상태에 대한 값을
    여러가지 속성(index, count, current, first, last)으로 반환함
- forTokens: for문 + StringTokenizer  클래스 기능
-->

<!-- 일반 for문: forEach 태그
1에서 100까지 정수 중 홀수의 합 출력하기 -->
<c:forEach var="i" begin="1" end="100" step="1">
    <c:if test="${i mod 2 eq 1}">
    <c:set var="sum" value="${sum+i}"/>
    </c:if>
</c:forEach>
홀수의 합 : ${sum} <br>
<hr>
<!-- 구구단 출력하기 : 이중 forEach문을 사용
- varStatus 속성 이용
각 단의 첫번째 행을 출력하기 전에 몇 단인지 출력하도록 하고
마지막행을 출력한 후에 구분선(--------)을 출력하도록 하기
-->
<c:forEach var="dan" begin="2" end="9" step="1">
    <c:forEach var="j" begin="1" end="9" varStatus="status">
        <c:if test="${status.first}"> <%--각 단의 첫번째 행을 출력하기 전--%>
            <p style="color: red"> ${dan}단 <br></p>
        </c:if>
        ${dan} X ${j} = ${dan*j} <br>

        <c:if test="${status.last}"><%-- 마지막 행을 출력한 후 --%>
            ---------------------<br>
        </c:if>
    </c:forEach>
</c:forEach>

<!-- 확장 for문: forEach 태그
배열에 저장된 이름들을 콤마(,)로 구분해서 출력하되 마지막 값에는 콤마를 붙이지 않고 출력하기
** Data 클래스에 문자열 입력값을 받아서 문자열 배열로 반환하는 getStringArray()메소드를
    정의하고 이것을 EL에서 이용하여 items에 값으로 입력함
-->
<c:set var="names" value="${Data.getStringArray('홍길동', '이순신', '강감찬')}"/>
<c:forEach var="name" items="${names}" varStatus="status">
    ${name}<c:if test="${not status.last}">, </c:if>
</c:forEach>
<hr>
<!-- List객체에 저장된 Person 객체의 이름과 나이 출력하기 -->
<c:forEach var="person" items="${heroList}">
    이름: ${person.name}, 나이: ${person.age} <br>
</c:forEach>
<hr>
<!-- forTokens 태그를 이용해서 문자열을 토큰으로 출력하기 -->
<c:set var="subjects" value="Java, HTML, CSS, Javascript, SQL, Servlet, JSP"/>
<c:forTokens var="subject" items="${subjects}" delims="," varStatus="status">
    ${subject}<c:if test="${not status.last}"># </c:if>
</c:forTokens>

<hr>

<!-- 4. 페이지 이동 태그: import, redirect
import 태그: url속성의 otherPage.jsp의 실행결과를 var속성의 contents 변수에 저장함
-->
<c:set var="bookName" value="JSP프로그래밍" scope="request"/>
<c:import  var="contents" url="ex07_otherPage.jsp">
    <c:param name="category1" value="컴퓨터/인터넷"/>
    <c:param name="category2" value="웹프로그래밍"/>
</c:import>

contents 변수에 저장된 내용: <br>
${contents}
<%--

<!-- redirect 태그: response 객체의 sendRedirect() 메소드와 같은 기능을 하는 태그
context 속성에 컨텍스트 경로를 지정하면 url 속성에는 그 이하의 경로를 지정해야 함 -->
<c:redirect url="ex07_otherPage.jsp">
    <c:param name="category1" value="컴퓨터/인터넷"/>
    <c:param name="category2" value="웹프로그래밍"/>
</c:redirect>

<c:redirect url="/jsp_ex/ex07_otherPage.jsp" context="${pageContext.request.contextPath}">
    <c:param name="category1" value="컴퓨터/인터넷"/>
    <c:param name="category2" value="웹프로그래밍"/>
</c:redirect>
--%>

<hr>

<!-- 5. url 태그: url을 변수로 저장해서 사용할 수 있게 함
value 속성: 컨텍스트 경로를 기본적으로 포함하고 있으므로 컨텍스트 이하의 경로를 붙이면 됨
-->
<c:url var="url" value="ex07_otherPage.jsp"/>
<a href="${url}?category1=spring5&category2=기본서">ex07_other.jsp 바로가기</a><br>
<c:url var="main" value="../index.jsp"/>
<a href="${main}">main페이지 바로 가기</a>

<hr>

<!-- 6. out 태그
- 표현식과 EL과 동일한 역할
- 출력내용에 포함된 HTML태그를 해석해서 적용할 수 있는 escapeXml속성이 있음
    escapeXml속성을 false로 지정하면 HTML 태그를 해석해서 마크업이 적용된 상태로 출력함
 - 출력내용이 null일 경우 기본값을 지정해서 출력할 수 있는 default속성이 있음
 빈 문자열은 값으로 해석해서 default 값이 출력되지 않음
-->
<c:set var="iTag">
    i 태그는 <i style="color:red">기울임</i>을 표현하다.
</c:set>

표현식이나 EL과 동일한 역할을 하는 출력: <c:out value="${iTag}"/> <br>
출력내용에 포함된 HTML 태그를 해석해서 출력: <c:out value="${iTag}" escapeXml="false"/><br>
출력내용이 null인 경우 default 속성값 출력: <c:out value="${param.test}" default="테스트 내용"/> <br>
출력내용이 빈 문자열인 경우의 출력: <c:out value="" default="테스트 내용"/> <br>

<hr>

<!-- 7. catch 태그: 예외 발생 구문에서 예외를 받아서 var 속성에 저장함 -->
<c:catch var="e">
    <%
        int result = 100/0;
    %>
</c:catch>
<!-- 예외처리 구문 정의 -->
<c:if test="${not empty e}">예외 발생: ${e} </c:if>
</body>
</html>

