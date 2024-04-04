<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="human.web.member.*" %>
<%-- 자바빈(<jsp:useBean>)과 액션태그(<jsp:setProperty>)를 이용해서 MemberDto객체를
    생성하고 join.jsp에서 전달된 입력값을 MemberDTO객체에 저장하기 --%>

<jsp:useBean id="dto" class="human.web.member.MemberDTO" />
<jsp:setProperty name="dto" property="*" />
<% //스크립트릿 : 서블릿으로 변환될 경우 _jspService()메소드 내에 포함되는 내용

//회원가입을 처리
//6개의 회원정보를 저장할 수 있는 객체 필요: DTO(Data Transfer Object) - MemberDTO
    request.setCharacterEncoding("UTF-8");
/* 자바빈( <jsp:useBean> )과 액션태그( <jsp:setProperty> )를 이용해서 처리함
    MemberDTO dto = new MemberDTO();
    dto.setMember_id(request.getParameter("member_id"));
    dto.setMember_pw(request.getParameter("member_pw"));
    dto.setMember_name(request.getParameter("member_name"));
    dto.setNickname(request.getParameter("nickname"));
    dto.setHandphone(request.getParameter("handphone"));
    dto.setEmail(request.getParameter("email"));
*/

//회원정보를 데이터베이스에 저장하는 것을 지원하는 객체 필요: DAO(Data Access Object) - MemberDAO
    MemberDAO dao = new MemberDAO();

    int result = dao.join(dto);

//회원정보 입력 성공시 메인페이지(index.jsp)로 이동하고
//회원정보 입력 실패시 회원가입페이지(join.jsp)로 이동하도록 함

//페이지의 이동: response객체나 dispatcher객체를 이용
//페이지 재요청: sendRedirect()
//기존의 요청을 유지하면서 페이지 이동: 포워드, forward()

    if (result == 1) {//회원가입 성공 시

        response.sendRedirect("../index.jsp");

    } else {//회원가입 실패 시

        response.sendRedirect("join.jsp");

    }

%>