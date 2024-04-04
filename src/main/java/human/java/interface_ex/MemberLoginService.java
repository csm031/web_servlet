package human.java.interface_ex;

public class MemberLoginService implements MemberService {

    @Override
    public void printTASK() { // 인터페이스의 추상메소드를 재정의한 것
        System.out.println("로그인 처리");
    }


    @Override
    public int login(String member_id, String member_pw) {
            int result = 0;

        return 0;
    }
}
