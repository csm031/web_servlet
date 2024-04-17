package human.web.dto;

public class EmailDTO {

    private String from;//보내는 사람의 메일 주소
    private String to;//받는 사람의 메일 주소
    private String subject;//제목
    private String content; //내용
    private String format;//보내는 내용의 형식(MIME 타입)

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }
}
