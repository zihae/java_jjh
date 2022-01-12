package kr.green.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.green.service.BoardService;
import kr.green.green.vo.BoardVO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired 
	BoardService boardService;
	
	@RequestMapping(value = "/list", method=RequestMethod.GET)
	public ModelAndView boardList(ModelAndView mv) {
		List<BoardVO> list = boardService.getBoardList("normal");
		//System.out.println(list);
		mv.addObject("list", list); //컨트롤러가 가져온 게시글을 화면에 전달
		mv.setViewName("/board/list");
		return mv;	
	}
	
	

}
