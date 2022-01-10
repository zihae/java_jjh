package kr.green.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		//세션에 있는 회원정보를 가져옴. 세션에 user로 저장했기에 user를 가져옴
		Object user = request.getSession().getAttribute("user");
		//세션에 회원정보가 없으면 => 로그인을 안했으면
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			//가던 URL로 가지 말고 위에 있는 URL로 이동
			return false;
		}
		return true; // 원래 가려던 URL로 가려면 return true;
	}
}
