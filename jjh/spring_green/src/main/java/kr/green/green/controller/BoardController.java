package kr.green.green.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.green.service.BoardService;
import kr.green.green.vo.BoardVO;
import kr.green.green.vo.MemberVO;

@Controller
public class BoardController {
	
	@Autowired 
	BoardService boardService;
	
	@RequestMapping(value = "/board/list", method=RequestMethod.GET)
	public ModelAndView boardList(ModelAndView mv) {
		List<BoardVO> list = boardService.getBoardList("normal");
		//System.out.println(list);
		mv.addObject("list", list); //컨트롤러가 가져온 게시글을 화면에 전달
		mv.setViewName("/board/list");
		return mv;	
	}
	@RequestMapping(value = "/board/detail")
	public ModelAndView boardDetail(ModelAndView mv, Integer bd_num) {
		//서비스한테 일을 시킴
		BoardVO board = boardService.getBoard(bd_num);
		mv.addObject("board", board);
		mv.setViewName("/board/detail");
		return mv;	
	}
	@RequestMapping(value = "/board/register", method=RequestMethod.GET)
	public ModelAndView boardRegisterGet(ModelAndView mv) {
		mv.setViewName("/board/register");
		return mv;	
	}
	@RequestMapping(value = "/board/register", method=RequestMethod.POST)
	public ModelAndView boardRegisterPost(ModelAndView mv, BoardVO board, HttpServletRequest request) {
		//로그인한 사용자 정보를 확인
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		//bd_type 설정
		board.setBd_type("normal");
		//화면에서 입력한 게시글이 오는지 확인
		//System.out.println(board);
		//서비스에게 일을 시킴
		boardService.registerBoard(board, user);
		//게시글 등록 후 완료되면 /board/list로 이동하도록 처리
		mv.setViewName("redirect:/board/list");
		return mv;	
	}
	
	
	

}
