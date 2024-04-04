package human.java.ex.inheritance;

public class PersonTest {
    public static void test(Person p) {
        //p가 student 객체인 경우 study()를 호출하고
        //p가 Worker객체인 경우 work()를 호출함.
        //참조변수의 객체를 판별하는 연산자: instanceof
        if (p instanceof Student student) {
            student.study();
        } else if (p instanceof Worker worker) {
            worker.work();
        }
    }

    public static void main(String[] args) {

        //참조형 변수의 데이터 타입 변환
        //: 자동형변환(업캐스팅, 참조영역 축소), 강제형변환(다운캐스팅, 참조영역 확대)
        Student s = new Student();
        s.study();
        Person p = s; //업캐스팅: 침조영역이 부모영역으로 축소
        // p.study(); //자식영역의 멤버를 참조하고자 할 경우 에러 발생
        Student s2 = (Student)p; //다운캐스팅: 참조영역이 원래대로 회복됨
        s2.study();

        Student s3 = new Student();
        test(s3);

        Worker w = new Worker();
        test(w);
        /*Student student1 = new Student("최승문",24,"남자","휴먼교육센터",2024);
        student1.eat();
        student1.study();
        student1.exercise();
        student1.sleep();


        Worker worker1 = new Worker("한기전",24,"남자","공사판","막노동1팀");
        worker1.eat();
        worker1.work();
        worker1.exercise();
        worker1.sleep();*/
    }
}
