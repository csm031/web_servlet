package human.web.member;

import java.sql.*;

public class DBCon {

    protected Connection conn;
    protected PreparedStatement pstmt;
    protected ResultSet rs;

    public DBCon() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            conn = DriverManager.getConnection(url, "web_dev", "1234");
            System.out.println("DB ok");

        } catch (Exception e) {
            System.out.println("DB error");
            e.printStackTrace();
        }
    }

    public void close() {
        try {

            if(conn != null) {
                conn.close();
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
