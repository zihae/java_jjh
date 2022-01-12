package kr.green.green.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class GuestInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		//세션에 안에 유저정보가 있는지 없는지 가져오는 코드
		Object user = request.getSession().getAttribute("user");
		//회원정보가 있으면 넘어오지 못하게 막아 줌 
		if(user != null) {
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
		return true; 
	}
}
