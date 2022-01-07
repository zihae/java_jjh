package kr.green.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.spring.vo.BoardVO;

@Service
public interface BoardService {

	void registerBoard(BoardVO board);

	List<BoardVO> getBoardList(String string);

	BoardVO getBoard(Integer bd_num);

}
