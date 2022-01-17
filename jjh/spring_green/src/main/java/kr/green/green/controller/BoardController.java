package kr.green.green.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.green.service.BoardService;
import kr.green.green.vo.BoardVO;
import kr.green.green.vo.FileVO;
import kr.green.green.vo.MemberVO;

@Controller
public class BoardController {
	
	@Autowired 
	BoardService boardService;
	
	@RequestMapping(value = "/board/list", method=RequestMethod.GET)
	public ModelAndView boardList(ModelAndView mv) {
		List<BoardVO> list = boardService.getBoardList("normal");
		mv.addObject("list", list); //컨트롤러가 가져온 게시글을 화면에 전달
		mv.setViewName("/board/list");
		return mv;	
	}
	@RequestMapping(value = "/board/detail")
	public ModelAndView boardDetail(ModelAndView mv, Integer bd_num) {
		//서비스한테 일을 시킴
		BoardVO board = boardService.getBoard(bd_num);
		//게시글 번호와 일치하는 첨부파일을 가져오라고 시킴 
		List<FileVO> fileList = boardService.getFileList(bd_num);
		mv.addObject("fileList", fileList);
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
	public ModelAndView boardRegisterPost(ModelAndView mv, BoardVO board, HttpServletRequest request, List<MultipartFile> files) {
		//로그인한 사용자 정보를 확인
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		//bd_type 설정
		board.setBd_type("normal");
		//화면에서 입력한 게시글이 오는지 확인
		//System.out.println(board);
		//서비스에게 일을 시킴
		boardService.registerBoard(board, user, files);
		//게시글 등록 후 완료되면 /board/list로 이동하도록 처리
		mv.setViewName("redirect:/board/list");
		return mv;	
	}
	@RequestMapping(value = "/board/modify", method=RequestMethod.GET)
	public ModelAndView boardModifyGet(ModelAndView mv, Integer bd_num,HttpServletRequest request) {
		//컨트롤러에서 회원정보 확인
		MemberVO user = (MemberVO)request. getSession().getAttribute("user");
		//서비스에게 게시글,회원정보 가져오라고 시킴
		BoardVO board =boardService.getBoard(bd_num,user);
		//게시글이 null이면 게시글 상세로 이동, 게시글이 있으면 수정 화면으로 이동
		if(board == null) {
			mv.setViewName("redirect:/board/list");
		}else {
			mv.addObject("board", board);
			mv.setViewName("/board/modify");
		}
		mv.setViewName("/board/modify");
		return mv;	
	}
	@RequestMapping(value = "/board/modify", method=RequestMethod.POST)
	public ModelAndView boardModifyPost(ModelAndView mv, BoardVO board, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		boardService.updateBoard(board,user);
		//게시글 번호를 서버로 넘겨줌
		mv.addObject("bd_num", board.getBd_num());
		mv.setViewName("redirect:/board/detail");
		return mv;	
	}
	@RequestMapping(value = "/board/delete", method=RequestMethod.GET)
	public ModelAndView boardDeleteGet(ModelAndView mv, Integer bd_num, HttpServletRequest request) {
			//bd_num 매개변수 추가 후 게시글 번호 오는지 확인
			//System.out.println(bd_num);
		//로그인한 유저 정보 확인
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
			//user 정보 오는지 확인
			//System.out.println(user);
		//서비스에게 게시글 번호와 회원정보를 주면서 게시글 삭제하라고 시킴
		boardService.deleteBoard(bd_num,user);
		//삭제를 다하면 board list로 이동
		mv.setViewName("redirect:/board/list");
		return mv;	
	}
	@ResponseBody
	@RequestMapping("/board/download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    String uploadPath = "D:\\JAVA_jjh\\upload";
	    try{
	        String FormatName = fileName.substring(fileName.lastIndexOf(".")+1);
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);

	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
	
	

}
