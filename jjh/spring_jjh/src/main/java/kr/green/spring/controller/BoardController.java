package kr.green.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.service.BoardService;
import kr.green.spring.vo.BoardVO;
import kr.green.spring.vo.MemberVO;

//게시글 uri를 담당하는 컨트롤러. /board/xxx를 담당
@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;

	@RequestMapping(value="/list")
	public ModelAndView boardList(ModelAndView mv) {
		//등록된 모든 게시글을 보는 작업
		List<BoardVO> list = boardService.getBoardList("Normal");
		System.out.println(list);
		mv.addObject("list", list);
		mv.setViewName("/board/list");
		return mv;		
	}
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView boardRegisterGet(ModelAndView mv) {
		mv.setViewName("/board/register");
		return mv;		
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView boardRegisterPet(ModelAndView mv, BoardVO board,HttpServletRequest request) {
		//회원정보 가져오기
		MemberVO user= (MemberVO)request.getSession().getAttribute("user");
		board.setBd_me_id(user.getMe_id());
		board.setBd_type("Normal");
		System.out.println(board);
		boardService.registerBoard(board);
		mv.setViewName("/board/register");
		return mv;		
	}
	@RequestMapping(value="/detail")
	public ModelAndView boardDetail(ModelAndView mv, Integer bd_num) {
		mv.setViewName("/board/detail");
		//게시글 번호 확인
		//System.out.println("게시글 번호: " + bd_num);
		//게시글 = boardService.게시글 가져오기(게시글 번호);
		BoardVO board = boardService.getBoard(bd_num);
		//가져온 게시글 확인 
		//System.out.println(board);
		//화면에게 게시글을 전달
		mv.addObject("board", board);
		return mv;		
	}
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public ModelAndView boardDeleteGet(ModelAndView mv, Integer bd_num, HttpServletRequest request) {
		//게시글 번호 확인
		//System.out.println("게시글 번호: " + bd_num);
		//로그인한 유저 정보를 확인 
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		//System.out.println(user);
		//서비스에게 게시글 번호와 로그인한 유저 정보를 주면서 게시글 삭제하라고 시킴
		//boardService.게시글삭제(게시글 번호, 로그인한 유저정보);
		boardService.deleteBoard(bd_num,user);
		mv.setViewName("redirect:/board/list");
		return mv;		
	}
	
}
