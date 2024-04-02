package human.web.member;


import java.sql.SQLException;

public class MemberDAO extends DBCon {

    public int join(MemberDTO dto) throws SQLException {
        int result = 0; // 회원가입 실패 시 결과값

        //회원가입정보를 저장하기 위해 SQL구문을 정의함
        String sql = "insert into tb_member (m_idx, member_id, member_pw, member_name, "
                + "nickname, handphone, email) values(member_seq.nextval, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1,dto.getMember_id());
        pstmt.setString(2,dto.getMember_pw());
        pstmt.setString(3,dto.getMember_name());
        pstmt.setString(4,dto.getNickname());
        pstmt.setString(5,dto.getHandphone());
        pstmt.setString(6,dto.getEmail());

        result = pstmt.executeUpdate(); //데이터베이스에 적용된 row 수를 반환함

        return result;
    }
}
