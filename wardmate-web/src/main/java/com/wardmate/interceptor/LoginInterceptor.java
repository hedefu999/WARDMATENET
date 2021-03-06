package com.wardmate.interceptor;

import com.wardmate.constant.SimpleHttpMessage;
import com.wardmate.constant.WebAppConstant;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        if(session.getAttribute(WebAppConstant.LOGIN_SESSION_HEAD) != null){
            return true;
        }else {
            if(request.getHeader("x-requested-with") != null
                    && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
                //拦截到一个Ajax请求
                session.setAttribute(WebAppConstant.URL_INTERCEPTED, "/welcome");
            }else {
                String url = request.getRequestURI()+'?'+request.getQueryString();//获取上个页面的url
                session.setAttribute(WebAppConstant.URL_INTERCEPTED, url);
            }
            request.setAttribute("message", SimpleHttpMessage.LOGIN_CHECK_NOTVALID);
            request.getRequestDispatcher("/login").forward(request,response);
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
