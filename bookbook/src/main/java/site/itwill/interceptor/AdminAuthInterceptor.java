package site.itwill.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import site.itwill.dto.Member;


public class AdminAuthInterceptor extends HandlerInterceptorAdapter{
   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      HttpSession session = request.getSession();
      Member loginMember = (Member)session.getAttribute("loginMember");
      if(loginMember==null || loginMember.getPno()<5) {
         
         throw new Exception("차장 이상의 직급만 가능합니다.");
      }
      return true;
      
   }
   
   
   
}