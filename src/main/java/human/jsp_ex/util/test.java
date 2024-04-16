package human.jsp_ex.util;

import java.util.Scanner;

public class test {

    public static void main(String[] args) {
        Scanner dataLoad = new Scanner(System.in);

        System.out.println("아이디를 입력하세요:");
        String id = dataLoad.nextLine();

        System.out.println("비밀번호를 입력하세요:");
        String password = dataLoad.nextLine();

        System.out.println("이름을 입력하세요:");
        String name = dataLoad.nextLine();

        System.out.println("주소를 입력하세요:");
        String address = dataLoad.nextLine();

        System.out.println("나이를 입력하세요:");
        int age = dataLoad.nextInt();

        // Scanner 객체 닫기
        dataLoad.close();
    }
}