package human.java.ex.inheritance;

public class Person {
    String name;
    int age;
    String gender;

    public Person() {
    }

    public Person(String name, int age, String gender) {
        this.name = name;
        this.age = age;
        this.gender = gender;
    }

    public void eat() {
        System.out.println(name+"이 밥을 먹습니다.");
    }

    public void sleep() {
        System.out.println(name+"이 잠을 잡니다.");
    }

    public void exercise() {
        System.out.println(name+"이 운동을 합니다.");
    }

}
