<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //팝업창 관련 요청 처리

    String chkVal = request.getParameter("closeOneDay");

    if (chkVal != null && "1".equals(chkVal)) {
        Cookie cookie = new Cookie("popupClose", "Off");
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(60 * 60 * 24);
        response.addCookie(cookie);


        out.println("팝업창 : 하루동안 열지 않음");
    }
%>
