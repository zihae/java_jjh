package kr.green.green.service;

import java.util.List;

import kr.green.green.vo.BoardVO;
import kr.green.green.vo.MemberVO;

public interface BoardService {

	List<BoardVO> getBoardList(String bd_type);

	BoardVO getBoard(Integer bd_num);

	void registerBoard(BoardVO board, MemberVO user);

	BoardVO getBoard(Integer bd_num, MemberVO user);

	void updateBoard(BoardVO board, MemberVO user);

	void deleteBoard(Integer bd_num, MemberVO user);

}
