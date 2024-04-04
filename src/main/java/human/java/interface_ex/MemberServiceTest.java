package human.java.interface_ex;

public class MemberServiceTest {
    public static void test(MemberService service) {
        if (service instanceof MemberJoinService) {
            service.join(null);
        } else if (service instanceof MemberLoginService) {
            service.login(null, null);
        }
    }

    public static void main(String[] args) {
        MemberService mJoin = new MemberJoinService();
        MemberService mLogin = new MemberLoginService();
        MemberDTO dto = new MemberDTO();
        mJoin.join(dto);
        mLogin.login("hong", "1234");
    }
}
