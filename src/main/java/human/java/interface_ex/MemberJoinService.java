package human.java.interface_ex;

public class MemberJoinService implements MemberService {

    @Override
    public void printTASK() { // 인터페이스의 추상메소드를 재정의한 것
        System.out.println("회원가입 처리");
    }


    //회원가입 처리를 하는 메소드: join(MemberDTO):int
    @Override
    public int join(MemberDTO dto) {
        //회원가입 관련 처리 구현
        return 0;
    }

}
