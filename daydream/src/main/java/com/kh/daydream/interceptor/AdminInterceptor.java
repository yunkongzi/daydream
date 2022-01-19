//package com.kh.daydream.interceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//import com.kh.daydream.vo.MemberVo;
//
//public class AdminInterceptor extends HandlerInterceptorAdapter{
//	private final String ADMIN_ID = "kongzi";
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		HttpSession session = request.getSession();
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
//		if(memberVo == null || !memberVo.getUser_id().equals(ADMIN_ID)) {
//			//로그인 하기전 요청했던 경로가 있었다면 로그인 후에 그쪽으로 이동
//			String uri = request.getRequestURI();
//			String queryString = request.getQueryString();
//			String targetLocation = uri + "?" + queryString;
//			session.setAttribute("targetLocation", targetLocation);
//			response.sendRedirect("/member/login");
//			return false; //사용자가 실제 요청을 처리하지 않음
//		}
//		return true;
//	}
//}
