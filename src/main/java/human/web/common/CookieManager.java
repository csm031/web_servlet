package human.web.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

    public static void makeCookie(HttpServletResponse response, String cookieName,
                                  String cookieValue, int cookieTime) {
        Cookie cookie = new Cookie(cookieName, cookieValue); // 쿠키 생성
        cookie.setPath("/"); //경로 설정("/": 웹 어플리케이션 전체에서 사용되는 쿠키로 설정)
        cookie.setMaxAge(cookieTime); // 유효기간 설정(초 단위)
        response.addCookie(cookie);//response 객체에 추가
    }
}
