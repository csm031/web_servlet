<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="fileDownload" class="human.web.common.FileDownload"/>
${fileDownload.download(pageContext.request, pageContext.response, param.sName, param.oName)}

