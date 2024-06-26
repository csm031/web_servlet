package human.java.interface_ex;

public class MemberServiceTest {
    public static void test(MemberService service) {
        service.printTASK();
        if (service instanceof MemberJoinService) {
            service.join(null);
        } else if (service instanceof MemberLoginService) {
            service.login(null, null);
        }

        //상위계층의 인터페이스형으로 매개변수의 타입을 정의하고 인자값으로 하위 클래스 객체를
        //받으면 하위 클래스의 메소드 오버라이딩된 메소드를 참조타입 변환 없이 호출할 수 있음
    }

    public static void main(String[] args) {
        MemberService mJoin = new MemberJoinService();
        MemberService mLogin = new MemberLoginService();
        MemberDTO dto = new MemberDTO();
        mJoin.join(dto);
        mLogin.login("hong", "1234");

        test(mJoin);
        test(mLogin);

        //상위계층의 인터페이스형으로 참조변수의 타입을 정의하고 하위 클래스 내에 메소드
        //오버라이딩된 메소드를 호출하면 참조타입변환 없이 하위클래스의 오버라이드한 메소드
        //를 호출할 수 있음
    }
}
