package human.web.common;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import human.web.dto.EmailDTO;

public class EmailManager {

    private final Properties serverInfo;//서버정보
    private final Authenticator auth;//인증정보

    //인스턴스 블록을 이용한 인스턴스 필드 초기화
    {
        serverInfo = new Properties();
        //네이버 SMTP 서버 접속정보
        serverInfo.put("mail.smtp.host", "smtp.naver.com");
        serverInfo.put("mail.smtp.port", "465");
        serverInfo.put("mail.smtp.socketFactory.port", "465");
        serverInfo.put("mail.smtp.starttls.enable", "true");
        serverInfo.put("mail.smtp.auth", "true");
        serverInfo.put("mail.smtp.debug", "true");
        serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        serverInfo.put("mail.smtp.socketFactory.fallback", "false");
        serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2");//메일 서버와 SSL통신을 하기 위한 설정

        //네이버 사용자 인증 정보
        auth = new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("csm031", "S12HRNZ2VTNV");//네이버 계정정보
            }

        };
    }//end of instance block


    //이메일 전송 메소드
    public void sendEmail(EmailDTO mailInfo) throws AddressException, MessagingException {

        //이메일 서버와의 세션 생성
        Session session = Session.getInstance(serverInfo, auth);
        session.setDebug(true);

        //메일로 보낼 메시지 만들기
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(mailInfo.getFrom()));//보내는 사람의 메일 주소
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.getTo()));
        //받는 사람의 메일 주소
        msg.setSubject(mailInfo.getSubject());//제목
        msg.setContent(mailInfo.getContent(), mailInfo.getFormat());//내용과 내용의 형식(MIME 타입)

        //메일보내기
        Transport.send(msg);
    }

    public String checkEmail(String email) throws AddressException, MessagingException {
        //인증번호(6자리) 생성 및 저장: Math.random() - 0 <= r(실수, 난수) < 1
        //1 <= r < 10 난수(random number) 발생시키기: Math.random()*9 + 1
        //인증번호의 범위: 111111 <= r < 1000000: Math.random()*(1000000-111111) + 111111
        int authNumber = (int)(Math.random()*(1000000-111111)) + 111111;

        String from = "네이버 메일 주소";
        String to = email;
        String subject = "회원 가입 인증 메일입니다.";
        String content = "홈페이지를 방문해주셔서 감사합니다.<br><br>"+
                "인증번호: "+authNumber+
                "<br>해당 인증번호를 인증번호 확인란에 입력해 주세요.";

        EmailDTO mailInfo = new EmailDTO();
        mailInfo.setFrom(from);
        mailInfo.setTo(to);
        mailInfo.setSubject(subject);
        mailInfo.setContent(content);
        mailInfo.setFormat("text/html;charset=UTF-8");
        sendEmail(mailInfo);

        return Integer.toString(authNumber);
    }

}
