package human.web.dao;

import human.web.common.DBCP;
import human.web.dto.BoardDTO;

import java.sql.SQLException;

public class BoardDAO extends DBCP {
    public int insertBoard(BoardDTO dto) {
        int result = 0;

        try {
            if (dto.getOrigin_filename() != null) { // 파일 업로드가 된 경우
                String sql = "insert into tb_board (b_idx, m_idx, writer, title, content, origin_filename, save_filename)"
                        + " values (board_seq.nextval,?,?,?,?,?,?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, dto.getM_idx());
                pstmt.setString(2, dto.getWriter());
                pstmt.setString(3, dto.getTitle());
                pstmt.setString(4, dto.getContent());
                pstmt.setString(5, dto.getOrigin_filename());
                pstmt.setString(6, dto.getSave_filename());

            } else { // 파일 업로드가 되지 않은 경우
                String sql = "insert into TB_BOARD (b_idx, m_idx, writer, title, content )"
                        + " values (board_seq.nextval,?,?,?,?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, dto.getM_idx());
                pstmt.setString(2, dto.getWriter());
                pstmt.setString(3, dto.getTitle());
                pstmt.setString(4, dto.getContent());

            }

            result = pstmt.executeUpdate(); // 게시글 입력 처리 후 적용된 행의 수 반환

        } catch (SQLException e) {
            System.out.println("boardDAO error: " + e);
        }
        return result;
    }
}
