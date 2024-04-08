package human.jsp_ex.util;

public class Person {
    private String name;
    private int age;

    public Person() {}
    //생성자 정의 시 매개변수가 있는 생성자 정의 + 기본 생성자
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
