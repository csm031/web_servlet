package human.web.member;

import java.sql.*;

public class DBCon {

    protected Connection conn;
    protected PreparedStatement pstmt;
    protected ResultSet rs;

    public DBCon() {
        try {
            Class.forName("Oracle.jdbc.OracleDriver");// 드라이버 로드
            String url = "jdbc:oracle:thin:@localhost:1521:xe"; // DB Server URL
            conn = DriverManager.getConnection(url);
            System.out.println("DB 연결 성공");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("DB 연결 실패");
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (conn != null) {
                conn.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
