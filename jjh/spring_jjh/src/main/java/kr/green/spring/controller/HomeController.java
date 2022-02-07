package kr.green.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.service.MemberService;
import kr.green.spring.vo.MemberVO;
//@Controller가 있어야 URI을 분석하여 처리
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv) {
		
		mv.setViewName("/main/home");
		//화면으로 데이터를 보낼때 addObject를 사용
		//addObject("화면에서 사용할 이름", 데이터);
		mv.addObject("serverTime", "데이터" );
		
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginGet(ModelAndView mv) {
		System.out.println("/login:get :");
		mv.setViewName("/member/login");
		return mv;
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mv, MemberVO member) {
		System.out.println("/login:post :" + member);
		MemberVO user = memberService.login(member);
		if(user == null) {
			mv.setViewName("redirect:/login");
		}else {
			mv.addObject("user", user);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv, MemberVO user) {
		System.out.println("/signup:get :");
		mv.setViewName("/member/signup");
		return mv;
	}
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO user) {
		//MemberVO user = new MemberVO();
		//user.setMe_id(me_id);
		//user.setMe_birth(me_birth);
		System.out.println("/signup:post :" + user);
		if(memberService.signup(user)) {
			mv.setViewName("redirect:/"); //회원가입 성공하면 메인 페이지로
		}else {
			mv.setViewName("redirect:/signup");
		}
		return mv;
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutGet(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/logout:get :");
		//세션에 있는 유저 정보를 삭제 
		request.getSession().removeAttribute("user");
		mv.setViewName("redirect:/");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value ="/idcheck")
	public String ajaxTest1(String id){
		
		if(!memberService.idDuplicated(id))
			return "ok";
		return "no";
	}
	
	@RequestMapping(value = "/mypage")
	public ModelAndView mypageGet(ModelAndView mv, MemberVO input, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		MemberVO newUser = memberService.updateMember(input,user);
		//회원정보를 수정하면 -> newUser != null
		if(newUser != null) {
			request.getSession().setAttribute("user", newUser);
		}
		mv.setViewName("/member/mypage");
		return mv;
	}
	@RequestMapping(value = "/member/find")
	public ModelAndView memberFind(ModelAndView mv) {
		mv.setViewName("/member/find");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/member/find/id")
	public String memberFindId(@RequestBody MemberVO member) {
		return memberService.findId(member);
	}
	@ResponseBody
	@RequestMapping(value = "/member/find/pw")
	public String memberFindPw(@RequestBody MemberVO member) {
		//임시 비밀번호 생성
		//생성된 비밀번호를 DB에 저장
		//이메일로 새 비번을 전송
		return memberService.findPw(member);
	}
}
