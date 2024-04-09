<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${not empty bookName}">
    request 속성값: ${bookName} <br>
</c:if>
파라미터1 : ${param.category1} <br>
파라미터2 : ${param.category2} <br>