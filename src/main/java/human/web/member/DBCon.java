package human.web.member;

import java.sql.*;

public class DBCon {

    protected Connection con;
    protected PreparedStatement pstmt;
    protected ResultSet rs;

    public DBCon() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:xe";//DB Server에 대한 URL
            con = DriverManager.getConnection(url, "web_dev", "1234");
            System.out.println("DB 연결 성공");

        } catch (Exception e) {
            System.out.println("DB 연결 실패");
            e.printStackTrace();
        }
    }

    public void close() {
        try {

            if(con != null) {
                con.close();
            }
            if(pstmt != null) {
                pstmt.close();
            }
            if(rs != null) {
                rs.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
