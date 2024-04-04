package human.java.ex.inheritance;

public class Worker extends Person{

    String company;
    String department;

    public Worker() {
    }

    public Worker(String name, int age, String gender, String company, String department) {
        super(name, age, gender);
        this.company = company;
        this.department = department;
    }

    public void work() {
        System.out.println(name + "이 회사["+company+"]에서 일을 합니다.");
        System.out.println("부서명 : " + department);
    }
}
