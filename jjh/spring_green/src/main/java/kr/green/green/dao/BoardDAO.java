package kr.green.green.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.green.vo.BoardVO;

public interface BoardDAO {

	List<BoardVO> selectBoardList(@Param("bd_type")String bd_type);
	
	//dao에 리턴 타입(e.g.BoardVO)이 있으면 mapper에서 select구문 사용
	BoardVO getBoard(@Param("bd_num")Integer bd_num);

	void insertBoard(@Param("board")BoardVO board);

}
