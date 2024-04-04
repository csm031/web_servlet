package human.java.ex.inheritance2;

public class WorkTest {

    public static void test(Worker worker) {
        //매개변수로 들어오는 객체가 Developer면
        //"개발한다"를 출력하고, Designer이면 "디자인한다"를
        //출력하도록 구현
        worker.work();
        //메소드 오버라이딩된 메소드를 호출할 경우
        //다시 자식 데이터형으로 변환할 필요 X
        //부모클래스의 메소드가 숨겨져 버렸기 때문
        //메소드오버라이딩은 참조형변환에 영향 X
    }

    public static void main(String[] args) {
        Developer dev = new Developer();
        test(dev);
        Designer des = new Designer();
        test(des);

    }

}
