package human.java.interface_ex2;

public class Child implements Exercise {
    @Override
    public void walk() {
        System.out.println("아장아장 걷는다");
    }

    @Override
    public void run() {
        System.out.println("귀엽게 뛴다.");
    }

    @Override
    public void stretch() {
        System.out.println("귀엽게 스트레칭한다.");
    }

    @Override
    public void hideAndSeek() {
        System.out.println("숨바꼭질을 하다");
    }
}
