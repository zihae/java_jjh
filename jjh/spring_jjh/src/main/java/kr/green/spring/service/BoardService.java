package kr.green.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.spring.vo.BoardVO;
import kr.green.spring.vo.MemberVO;

@Service
public interface BoardService {

	void registerBoard(BoardVO board);

	List<BoardVO> getBoardList(String string);

	BoardVO getBoard(Integer bd_num);

	void deleteBoard(Integer bd_num, MemberVO user);

}
