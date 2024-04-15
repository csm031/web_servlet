package human.java.ex.io_ex;

public class IOEx01 {

    public static void main(String[] args) {

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
            * 보조 스트림 : 버퍼기능, 데이터 타입, 객체, 편의기능
            *   버퍼기능 : Buffered - BufferedInput/OutputStream
            *   데이터타입 : Data-
            *   객체 : Object-
            *   편의기능 : Scanner, PrintWriter
            * 기본 입출력객체를 생성자의 매개변수로 해서 객체 생성
            *   1. 기본 입출력 객체 생성
            *   2. 보조 스트림 객체 생성
        * */
    }

}
