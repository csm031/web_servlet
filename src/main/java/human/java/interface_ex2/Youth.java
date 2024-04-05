package human.java.interface_ex2;

public class Youth implements Exercise {
    @Override
    public void walk() {
        System.out.println("활기차게 걷는다.");
    }

    @Override
    public void run() {
        System.out.println("빠르게 뛴다");
    }

    @Override
    public void stretch() {
        System.out.println("정식 스트레칭 한다");
    }

    @Override
    public void doPushUps() {
        System.out.println("팔굽혀펴기를 하다");
    }
}
