<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="human.web.member.MemberDTO" %>
<%@ page import="human.web.member.MemberDAO" %>

<%
    MemberDTO dto = new MemberDTO();
    dto.setMember_id(request.getParameter("member_id"));
    dto.setMember_pw(request.getParameter("member_pw"));
    dto.setMember_name(request.getParameter("member_name"));
    dto.setNickname(request.getParameter("nickname"));
    dto.setHandphone(request.getParameter("handphone"));
    dto.setEmail(request.getParameter("email"));

    //회원정보를 데이터베이스에 저장하는 것을 지원하는 객체 필요 : DAT(Data Access Object) - MemberDAO
    MemberDAO dao = new MemberDAO();
    int result = dao.join(dto);
    //회원정보 입력 성공시 메인페이지(index.jsp)로 이동
    //회원정보 입력 실패시 회원강비페이지(join.jsp)로 이동

    //페이지의 이동:response 객체나 dispatcher 객체를 이용
    //페이지 재요청:sendRedirect()
    //기존의 요청을 유지하면서 페이지 이동 : 포워드

    if(result==1) {//회원가입 성공 시

        response.sendRedirect("../index.jsp");

    } else {//회원가입 실패시

        response.sendRedirect("../join.jsp");

    }
%>