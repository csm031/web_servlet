package human.java.ex.inheritance;

public class Student extends Person {
    String school;
    int year;

    public Student() {
    }

    public Student(String name, int age, String gender, String school, int year) {
        super(name, age, gender);
        this.school = school;
        this.year = year;
    }

    public void study() {
        System.out.println(name + "이 학교["+school+"]에 갑니다." );
    }
}
