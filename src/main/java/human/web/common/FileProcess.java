package human.web.common;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;

public class FileProcess {

    //MultipartRequest 객체 생성하기
    private MultipartRequest getMultipartRequest(ServletContext application,
            HttpServletRequest request) {
        String uploadPath = application.getRealPath("/upload");//업로드된 파일을 저장할 디렉터리
        int maxFileSize = 1024*1024*5; // 업로드 파일의 최대 크기(5 MB)
        String encoding = "UTF-8"; //업로드 파일의 인코딩

        MultipartRequest mRequest = null;

        try {
            mRequest = new MultipartRequest(request, uploadPath, maxFileSize, encoding);
        } catch (Exception e) {
            System.out.println("MultipartRequest 객체 생성 중 예외 발생");
        }
        return mRequest;
    }
}
