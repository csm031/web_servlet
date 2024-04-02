package human.web.member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.SQLException;

@WebServlet("/member/memberJoin")
public class MemberJoinServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //6개의 회원정보를 저장할 수 있는 객체 필요: DTO(Data Transfer Object) - MemberDTO
        MemberDTO dto = new MemberDTO();
        dto.setMember_id(request.getParameter("member_id"));
        dto.setMember_pw(request.getParameter("member_pw"));
        dto.setMember_name(request.getParameter("member_name"));
        dto.setNickname(request.getParameter("nickname"));
        dto.setHandphone(request.getParameter("handphone"));
        dto.setEmail(request.getParameter("email"));

        //회원정보를 데이터베이스에 저장하는 것을 지원하는 객체 필요: DAT(Data Access Object)
        MemberDAO dao = new MemberDAO();
        try {
            int result = dao.join(dto);

            // 회원정보 입력 성공시 메인페이지(index.jsp)로 이동하고
            // 회원정보 입력 실패시 회원가입페이지(join.jsp)로 이동하도록 함

            //페이지의 이동: response 객체나 dispatcher 객체를 이용


            if (result == 1) { //회원가입 성공

            } else { // 회원가입 실패

            }


        } catch (SQLException e) {
            System.out.println("회원정보 입력시 예외 발생");
            e.printStackTrace();
        }
    }



}
