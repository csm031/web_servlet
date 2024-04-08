package human.jsp_ex.util;

public class Conversion {

    //double 형의 값을 소수점 이하 자리를 없애고 int 값으로 변환하는 메소드
    public static int doubleToInt(double d) {
        return (int) d;
    }

    //입력되는 아이디에 "아이디:"문자열을 추가해서 반환하는 메소드
    public static String addStr(String member_id) {
        return "아이디: " + member_id;
    }

}
