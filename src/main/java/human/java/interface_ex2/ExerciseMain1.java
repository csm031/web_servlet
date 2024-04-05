package human.java.interface_ex2;

public class ExerciseMain1 {

    public static void test(Exercise person) {
        person.walk();
        person.run();
        person.stretch();

        if (person instanceof Child) {
            person.hideAndSeek();
        } else if (person instanceof Youth) {
            person.doPushUps();
        }
    }

    public static void main(String[] args) {
        Child child = new Child();
        Youth youth = new Youth();

        test(child);
        test(youth);

    }
}
