package human.java.ex.inheritance2;

public abstract class Worker {
    String name;
    int age;
    String gender;

    public void eat() {
        System.out.println("먹는다");
    }

    public void sleep() {
        System.out.println("잔다");
    }

    public void exercise() {
        System.out.println("운동한다");
    }

    public abstract void work();
}
