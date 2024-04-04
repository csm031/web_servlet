package human.java.ex.inheritance2;

public class Developer extends Worker{

    String language;

    @Override
    public void work() {
        System.out.println("개발한다.");
    }
}
