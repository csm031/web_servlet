package human.web.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class FileDownload {
    // 파일 다운로드를 처리하는 메소드
    public void download(HttpServletRequest request , HttpServletResponse response,
                         String sName, String oName) {
        String saveDirectory = request.getServletContext().getRealPath("/uploads");
        String save_filename = sName;
        String origin_filename = oName;

        File file = new File(saveDirectory, save_filename);
        InputStream is = null;
        OutputStream os = null;
        try {
             is = new FileInputStream(file);
             os = response.getOutputStream();

            //한글 파일명 깨짐 처리 방지를 위한 구문
            String client = request.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                origin_filename = new String(origin_filename.getBytes("UTF-8"), "ISO8859-1");
            } else {
                origin_filename = new String(origin_filename.getBytes("KSC5601"), "ISO8859-1");
            }
            //WOW64 : Windows on Windows 64-bit, 64비트 버전의 Windows에서 32비트 응용프로그램을 실행할 수 있다는
            //의미로 인터넷 익스플로러(IE)의 실행결과에서 출력됨
            //HTTP의 정보는 ASCII로 인코딩되므로 여기에 문자셋을 맞추기 위해서 먼저 파일 이름을 UTF-8로 된 배열 생성 후
            //ISO-8859-1 문자셋으로 문자열 객체를 생성함

            //파일 다운로드용 응답헤더 설정
            response.reset();
            response.setContentType("application/octet-stream");// 파일 다운로드를 위한 MIME 타입
            response.setHeader("Content-Disposition","attachment; filename=\"" + origin_filename + "\"");
            //파일 다운로드 MIME 타입과 함께 설정되는 컨텐츠 처리 헤더 설정
            response.setHeader("Content-Length",""+file.length());

            //출력 스트림에 파일 내용 출력하기
            //파일 크기의 바이트 배열을 생성해서 출력
            byte[] buffer = new byte[(int)file.length()];
            is.read(buffer);
            os.write(buffer);

        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("file download error");
        }
        finally {
            if (is != null) { try {is.close();} catch ( IOException e ) {e.printStackTrace();} }
            if (os != null) { try {os.close();} catch ( IOException e ) {e.printStackTrace();} }
            }
        }
    }