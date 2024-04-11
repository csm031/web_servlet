package human.web.dto;
import java.util.Date;

public class BoardDTO {
    public BoardDTO() {
    }

    private int b_idx; //게시글번호
    private int m_idx; //회원번호
    private String writer;//작성자
    private String title;//제목
    private String content;//내용
    private String origin_filename;//원본파일명
    private String save_filename;//저장파일명
    private int read_cnt;//조회수
    private Date post_date;//작성일
    private Date update_date;//수정일
    private int board_status;//게시물상태(1:유지, -1:삭제)

    public int getB_idx() {
        return b_idx;
    }

    public void setB_idx(int b_idx) {
        this.b_idx = b_idx;
    }

    public int getM_idx() {
        return m_idx;
    }

    public void setM_idx(int m_idx) {
        this.m_idx = m_idx;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOrigin_filename() {
        return origin_filename;
    }

    public void setOrigin_filename(String origin_filename) {
        this.origin_filename = origin_filename;
    }

    public String getSave_filename() {
        return save_filename;
    }

    public void setSave_filename(String save_filename) {
        this.save_filename = save_filename;
    }

    public int getRead_cnt() {
        return read_cnt;
    }

    public void setRead_cnt(int read_cnt) {
        this.read_cnt = read_cnt;
    }

    public Date getPost_date() {
        return post_date;
    }

    public void setPost_date(Date post_date) {
        this.post_date = post_date;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public int getBoard_status() {
        return board_status;
    }

    public void setBoard_status(int board_status) {
        this.board_status = board_status;
    }

    public BoardDTO(int b_idx, int m_idx, String writer, String title, String content, String origin_filename, String save_filename, int read_cnt, Date post_date, Date update_date, int board_status) {
        this.b_idx = b_idx;
        this.m_idx = m_idx;
        this.writer = writer;
        this.title = title;
        this.content = content;
        this.origin_filename = origin_filename;
        this.save_filename = save_filename;
        this.read_cnt = read_cnt;
        this.post_date = post_date;
        this.update_date = update_date;
        this.board_status = board_status;
    }
}
