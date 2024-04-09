package human.jsp_ex.util;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Data {


    String name;

    public String getName() {

        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    //클래스 이름만으로 접근할 수 있는 메소드: static(정적) 메소드/클래스 메소드
    //java.util.Date객체를 반환하는 메소드: getDate()
    public static Date getDate() {
        return new Date();
    }

    //Person객체를 반환하는 메소드: getPerson()
    public static Person getPerson(String name, int age) {
        return new Person(name, age);
    }

    //Person객체를 저장하는 ArrayList객체를 반환하는 메소드: getPersonList()
    public static List<Person> getPersonList(Person ...persons) {
        List<Person> personList = new ArrayList<>();
        for (Person person : persons) {
            personList.add(person);
        }
        return personList;
    }
}
