package human.web.dao;

import human.web.common.DBCP;
import human.web.dto.BoardDTO;
import human.web.dto.SearchDTO;

import java.sql.SQLException;
import java.util.ArrayList;

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
                String sql = "insert into TB_BOARD (b_idx, m_idx, writer, title, content)"
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

    // 검색조건을 포함해서 모든 게시글 조회하기
    public ArrayList<BoardDTO> getBoardList(SearchDTO dto) {
        ArrayList<BoardDTO> boardList = new ArrayList<>();
// 제네릭을 이용해서 컬렉션 객체 생성 시 참조변수의 제네릭타입이 생성자의 제네릭타입과
// 같은 경우 생성자의 제네릭타입을 생략할 수 있음
        try {
            if (dto.getSearchWord() != null) { //검색어로 검색한 경우
                //검색영역을 체크하는 구문
                String searchField = null;
                switch (dto.getSearchField()) {
                    case "title":
                        searchField = "title";
                        break;
                    case "content":
                        searchField = "content";
                        break;
                    case "writer":
                        searchField = "writer";
                }

                String sql = "select * from tb_board where board_status = 1"
                        + " and " + searchField + " like '%' || ? || '%' "
                        + " order by b_idx desc";

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, dto.getSearchWord()); // 검색어 세팅
            } else { // 검색어로 검색하지 않은 경우
                String sql = "select * from tb_board where board_status = 1"
                        + " order by b_idx desc";

                pstmt = conn.prepareStatement(sql);
            }
            rs = pstmt.executeQuery(); //조회된 결과를 ResultSet 객체에 담음

            while (rs.next()) {// rs.next(): ResultSet 객체의 BOF 에서부터 시작해서
                //저장된 데이터를 하나씩 확인해서 있으면 true 반환
                BoardDTO bDto = new BoardDTO();
                bDto.setB_idx(rs.getInt("b_idx"));
                bDto.setM_idx(rs.getInt("M_idx"));
                bDto.setWriter(rs.getString("writer"));
                bDto.setTitle(rs.getString("title"));
                bDto.setContent(rs.getString("content"));
                bDto.setPost_date(rs.getDate("post_date"));
                bDto.setRead_cnt(rs.getInt("read_cnt"));
                bDto.setOrigin_filename(rs.getString("origin_filename"));
                bDto.setSave_filename(rs.getString("save_filename"));
                boardList.add(bDto);
            }
        } catch (Exception e) {

        }


        return boardList;
    }

    //조회수 증가시키기
    public void updateRead_cnt(int b_idx) {
        try {
            String sql = "update tb_board set read_cnt = read_cnt + 1 where b_idx = ?" ;

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, b_idx);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("updateRead_cnt ERROR: " + e);
        }
    }
    //게시글 가져오기
    public BoardDTO getBoard(int b_idx) {
        BoardDTO dto = null;

        try {
            String sql = "select * from tb_board where b_idx = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, b_idx);

            rs = pstmt.executeQuery();
            if (rs.next()) { // 결과값이 있는 경우
                dto = new BoardDTO();
                dto.setB_idx(rs.getInt("b_idx"));
                dto.setM_idx(rs.getInt("M_idx"));
                dto.setWriter(rs.getString("writer"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setOrigin_filename(rs.getString("origin_filename"));
                dto.setSave_filename(rs.getString("save_filename"));
                dto.setRead_cnt(rs.getInt("read_cnt"));
                dto.setPost_date(rs.getDate("post_date"));
                dto.setUpdate_date(rs.getDate("update_date"));
            }
        } catch (SQLException e) {
            System.out.println("getBoard ERROR: " + e);
        }

        return dto;
    }

}
