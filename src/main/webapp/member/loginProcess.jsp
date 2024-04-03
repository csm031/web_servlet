<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="human.web.member.MemberDTO" %>
<%@ page import="human.web.member.MemberDAO" %>

<%
    String member_id = request.getParameter("member_id");
    String member_pw = request.getParameter("member_pw");

    MemberDAO dao = new MemberDAO();

    int result = dao.login(member_id, member_pw);

    //로그인이 정상적으로 이루어진 경우 session 객체에 회원정보를 저장해서 메인페이지로 이동
    //로그인이 실패한 경우 "아이디나 비밀번호가 일치하지 않습니다"를 저장해서 로그인페이지로 이동

    if (result == 1) {
        MemberDTO dto = dao.getMember(member_id);

        //세션객체에 회원정보를 member이라는 이름으로 저장 : setAttribute(String, Object)
        session.setAttribute("member",dto);
        response.sendRedirect("../index.jsp");
    } else {
        request.setAttribute("msg","아이디나 비밀번호가 일치하지 않습니다.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);

    }
%>