package human.web.member;


import java.sql.ResultSet;
import java.sql.SQLException;

//public class MemberDAO extends DBCon {
public class MemberDAO extends DBCP {
    public MemberDAO() {
        super();
    }

    public int join(MemberDTO dto) {
        int result; // 회원가입 실패 시 결과값

        //회원가입정보를 저장하기 위해 SQL구문을 정의함
        String sql = "insert into tb_member (m_idx, member_id, member_pw, member_name, "
                + "nickname, handphone, email) values(member_seq.nextval, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);


            pstmt.setString(1, dto.getMember_id());
            pstmt.setString(2, dto.getMember_pw());
            pstmt.setString(3, dto.getMember_name());
            pstmt.setString(4, dto.getNickname());
            pstmt.setString(5, dto.getHandphone());
            pstmt.setString(6, dto.getEmail());

            result = pstmt.executeUpdate(); //데이터베이스에 적용된 row 수를 반환함
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    public int login(String member_id, String member_pw) {
        //아이디와 비밀번호가 같은 데이터의 개수를 count()함수를 이용해서 가져옴
        //로그인 성공 시 1 반환, 실패 시 0 반환
        int result = 0;
        try {
            String sql = "select count(*) from tb_member where member_id = ? and member_pw = ? and MEMBER_STATUS = 1";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, member_id);
            pstmt.setString(2, member_pw);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("로그인 처리 중 예외 발생");
            e.printStackTrace();
        }
        //로그인 성공 시 회원정보를 가져오는 getMember()메서드를 처리해야 하기 때문에
        //close메서드를 사용하지 않음
        return result;
    }

    public MemberDTO getMember(String member_id) throws SQLException {
        MemberDTO dto = null;
        try {
            String sql = "select * from tb_member where member_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member_id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new MemberDTO();
                dto.setM_idx(rs.getInt("m_idx"));
                dto.setMember_id(rs.getString("member_id"));
                dto.setMember_pw(rs.getString("member_pw"));
                dto.setMember_name(rs.getString("member_name"));
                dto.setNickname(rs.getString("nickname"));
                dto.setHandphone(rs.getString("handphone"));
                dto.setEmail(rs.getString("email"));
                dto.setGrade(rs.getInt("grade"));
                dto.setReg_date(rs.getDate("reg_date"));
                dto.setUpdate_date(rs.getDate("update_date"));
                dto.setMember_status(rs.getInt("member_status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            close();
        }
        //아이디를 이용해서 회원정보를 가져오기

        return dto;
    }

    public int update(MemberDTO dto) {
        int result = 0; //회원정보 변경 실패 시 결과값
        try {
            String sql = "update tb_member set member_pw = ?, member_name = ?, nickname=?, " +
                    "handphone = ?, email=? where m_idx = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getMember_pw());
            pstmt.setString(2, dto.getMember_name());
            pstmt.setString(3, dto.getNickname());
            pstmt.setString(4, dto.getHandphone());
            pstmt.setString(5, dto.getEmail());
            pstmt.setInt(6, dto.getM_idx());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return result;
    }

    public MemberDTO getMember(int m_idx) throws SQLException {
        MemberDTO dto = null;
        try {
            //회원정보를 이용해서 회원정보를 가져오기
            String sql = "select * from tb_member where M_IDX = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, m_idx);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new MemberDTO();
                dto.setM_idx(rs.getInt("m_idx"));
                dto.setMember_id(rs.getString("member_id"));
                dto.setMember_pw(rs.getString("member_pw"));
                dto.setMember_name(rs.getString("member_name"));
                dto.setNickname(rs.getString("nickname"));
                dto.setHandphone(rs.getString("handphone"));
                dto.setEmail(rs.getString("email"));
                dto.setGrade(rs.getInt("grade"));
                dto.setReg_date(rs.getDate("reg_date"));
                dto.setUpdate_date(rs.getDate("update_date"));
                dto.setMember_status(rs.getInt("member_status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return dto;
    }

    public int cancel(int m_idx) throws SQLException {
        int result = 0; // 회원탈퇴 실패 시 결과값
        try {
            //회원탈퇴 요청한 회원의 회원상태를 -1로 변경하기
            String sql = "update tb_member set MEMBER_STATUS = -1  where M_IDX = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, m_idx);

            result = pstmt.executeUpdate();
            //로그인 처리 메소드의 SQL문에 회원상태를 조건으로 추가해줌
            System.out.println("c OK");
        } catch (SQLException e) {
            System.out.println("회원탈퇴 처리 시 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
}
