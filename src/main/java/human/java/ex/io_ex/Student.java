package human.java.ex.io_ex;

//객체 입출력의 대상이 되는 클래스
//- Serializable 인터페이스 상속
// 객체직렬화: 객체를 데이터의 흐름으로 변경시키는 것
// 객체의 필드 중 뺴고 싶은 필드에는 transinet 수정자를 붙여줌

public class Student {
    private String name;
    private int year;
    private transient String handphone;

    public Student() {
    }

    public Student(int year, String name, String handphone) {
        this.year = year;
        this.name = name;
        this.handphone = handphone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getHandphone() {
        return handphone;
    }

    public void setHandphone(String handphone) {
        this.handphone = handphone;
    }
}
