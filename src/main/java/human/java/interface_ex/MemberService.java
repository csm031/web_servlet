package human.java.interface_ex;

public interface MemberService {
    String MEMBERSHIP_NAME = "일반회원";

    //변수의 형태로 정의되어지는 것: 상수 - public static final 생략되있음
    void printTASK();
    //내용이 없는 메소드: 추상메소드 - public abstract 생략되어 있음

    //default 메소드 정의: 하위 클래스의 메소드 오버라이딩을 위해서 인터페이스에 주로 정의
    //강제성이 없으므로 하위 클래스 중 필요한 클래스에서만 오버라이딩하면 됨
    default int join(MemberDTO dto) {
        return 0;
    }
    //default 나 static 메소드는 앞에 모두 public 이 생략되어 있음

    default int login(String member_id, String member_pw) {
        return 0;
    }
}

