package kr.green.spring.service;

import org.springframework.stereotype.Service;

import kr.green.spring.vo.BoardVO;

@Service
public interface BoardService {

	void registerBoard(BoardVO board);

}
