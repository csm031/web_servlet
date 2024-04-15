package human.java.ex.io_ex;

import java.io.*;

public class IOEx01 {
    /* JAVA IO(입출력)
    - java.io 패키지
    - 입력과 출력의 기준: 자바프로그램
    - 입력과 출력의 데이터 흐름: 스트림(단방향)
    - 가장 기본이 되는 입출력 스트림: InputStream, OutputStream - 추상 클래스
    - 자바프로그램에서 입출력을 하려면 입출력 객체가 있어야 함
        InputStream <= System.in
        OutputStream <= System.out
    - 입력객체의 주요 메소드: read(), read(byte[] buffer)
    - 출력객체의 주요 메소드: write(), write(byte[] buffer)
    - 입출력 단위: 1byte(바이트 단위), 2byte(문자 단위)
    - 입출력에 따른 입출력 객체
        바이트 단위: InputStream, OutputStream
        문자 단위: Reader, Writer - 추상클래스
            (객체를 얻는 방법) InputStreamReader, OutputStreamWriter

    - 파일: File 클래스
    - 파일객체: 디렉토리, 파일
    - 시스템에 디렉토리와 파일 생성 방법
        1. 파일 객체 생성: new File(디렉토리명 또는 파일명)
        *   2. 기능을 수행하는 메소드 실행 : mkdir(), mkdirs(), createNewFile
        * 파일에 입출력을 할 수 있도록 지원하는 클래스 : 일반 클래스
        *   1. 바이트 단위 : FilteInputStream, FileOutputStream
        *   2. 문자 단위 : FileReader, FIleWriter
        *
        * 보조 스트림(기능 추가) : 버퍼기능, 데이터 타입, 객체, 편의기능
        *   버퍼기능 : Buffered - BufferedInput/OutputStream, BufferedReader/Writer
        *   데이터타입 : Data - : DataInput/OutputStream
        *   객체 : Object - : ObjectInput / OutputStream
        *   편의기능 : Scanner, PrintWriter
        * 기본 입출력객체를 생성자의 매개변수로 해서 객체 생성
        *   1. 기본 입출력 객체 생성
        *   2. 보조 스트림 객체 생성
    * */
    public static void main(String[] args) throws IOException {
        //가장 기본적인 입출력 객체: InputStream, OutputStream
        InputStream is = System.in; //입력매체: 키보드
        OutputStream os = System.out; //출력매체 : 모니터

        /*// 바이트 단위 입출력하기
        System.out.println("데이터 입력");
        byte b = (byte) is.read();
        System.out.println("데이터 출력:");
        os.write(b);
        os.flush();//출력객체에 저장된 데이터를 강제 출력시킴*/

        //bye배열을 이용한 데이터 입출력하기: 메소드 내부적으로 반복문 처리가 되어 있음
        /*byte[] buffer = new byte[1024];
        System.out.println("데이터 입력:");
        is.read(buffer);
        System.out.println("데이터 출력:");
*//*        os.write(buffer); //byte배열에 저장된 모든 데이터 출력*//*
        os.write(buffer, 10, 20); // 배열의 지정된 인덱스(10)부터 지정된 개수 (20) 만큼 출력*/
/*

        //문자단위 기본 입출력 객체: Reader, Writer - 추상클래스
        Reader reader = new InputStreamReader(is);
        Writer writer = new OutputStreamWriter(os);

        //보조 스트림 추가: 버퍼와 출력 편의성 추가
        BufferedReader br = new BufferedReader(reader);
        BufferedWriter bw = new BufferedWriter(writer);
        PrintWriter pw = new PrintWriter(bw, true); //true : autoFlush 기능 실행

        System.out.println("데이터 입력:");
        String inputData = br.readLine(); //입력 데이터를 줄 단위로 읽어서 문자열로 반환
        System.out.println("데이터 출력:");
        pw.println(inputData); //print() 메소드 사용, 버퍼가 차지 않아도 자동으로 flush 기능 수행
*/

        //파일에 출력된 데이터 타입 그대로 입력값으로 가져오기: DataInput/OutputStream
        //프로젝트 폴더/test/test.dat 파일에 데이터를 출력하고 읽어오기
        //test 디렉토리 생성하기
        /*File dir = new File("test");
        dir.mkdir();*/

        //test디렉토리 안에 test.dat 파일을 생성하고 기본 데이터 타입으로 데이터 출력하기
        // 파일 생성하기
        /*File file = new File("test/test.dat");
        file.createNewFile();*/
        //파일
/*        FileOutputStream fos = new FileOutputStream("test/test.dat");
        DataOutputStream dos = new DataOutputStream(fos);

        dos.writeInt(100);
        dos.writeDouble(100.25);
        dos.writeChar('A');
        dos.writeUTF("홍길동");
        System.out.println("기본타입 데이터 출력 완료");
        FileInputStream fis = new FileInputStream("test/test.dat");
        DataInputStream dis = new DataInputStream(fis);
        System.out.println("기본타입 데이터 입력 결과:");
        System.out.println(dis.readInt());
        System.out.println(dis.readDouble());
        System.out.println(dis.readChar());
        System.out.println(dis.readUTF());
        //출력된 내용을 기본 타입 그대로 읽어올 때 출력된 순서대로 입력받아야 함*/
        //객체 입출력하기: ObjectInput/OutputStream
        //프로젝트 폴더 test/test2.ser 파일에 Student 객체를 출력하고 읽어오기
        //Student 클래스: name, year, handphone 을 필드로 가지고 매개변수 생성자를
        // 정의해서 객체 생성 시 필드가 초기화될 수 있도록 정의함









    }

}
