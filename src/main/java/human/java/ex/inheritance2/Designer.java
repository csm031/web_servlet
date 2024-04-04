package human.java.ex.inheritance2;

public class Designer extends Worker{

    String tool;

    @Override
    public void work() {
        System.out.println("디자인한다.");
    }
}
