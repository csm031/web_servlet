package human.jsp_ex.util;

import javax.servlet.ServletContext;
import java.io.BufferedReader;
import java.io.FileReader;

public class Conversion {

    //double 형의 값을 소수점 이하 자리를 없애고 int 값으로 변환하는 메소드
    public static int doubleToInt(double d) {
        return (int) d;
    }

    //입력되는 아이디에 "아이디:"문자열을 추가해서 반환하는 메소드
    public static String addStr(String member_id) {
        return "아이디: " + member_id;
    }

    //이메일 보낼 때 내용이 HTML인 경우 HTML 메일양식을 이용한 메일 내용으로 바꿔주는 메소드
    public static String contentToHTML(ServletContext application, String content) {
        StringBuilder result = new StringBuilder(); //문자열 조작이 많을 경우 효율적으로 문자열 작업을 지원하는 클래스
        //HTML로 변환되는 내용을 담을 StringBuilder 객체 생성

        //줄바꿈을 <br> 태그로 변환
        content = content.replaceAll("\r\n", "<br>");

        try {

            //HTML 메일양식 파일 읽기
            String mailFormPath = application.getRealPath("/member/mailForm.html");
            BufferedReader br = new BufferedReader(new FileReader(mailFormPath));

            //메일양식 파일의 내용을 한 줄씩 읽어서 result에 저장하기
            String data = null;
            while((data = br.readLine()) != null) {
                result.append(data + "\n");
            } br.close();

        } catch ( Exception e ) {
            System.out.println("contentToHTML error");
            e.printStackTrace();
        }
        //메일양식의 __CONTENT__부분을 메일 내용으로 바꾸기
        String htmlContent = result.toString();
        htmlContent = htmlContent.replaceAll("__CONTENT__", "content");
        
        return htmlContent;
    }

}
