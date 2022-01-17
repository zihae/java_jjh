package kr.green.green.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.green.dao.BoardDAO;
import kr.green.green.utils.UploadFileUtils;
import kr.green.green.vo.BoardVO;
import kr.green.green.vo.FileVO;
import kr.green.green.vo.MemberVO;

@Service
public class BoardServiceImp implements BoardService {
	
	@Autowired
	BoardDAO boardDao;
	
	String uploadPath = "D:\\JAVA_jjh\\upload";

	@Override
	public List<BoardVO> getBoardList(String bd_type) {
		return boardDao.selectBoardList(bd_type);
	}

	@Override
	public BoardVO getBoard(Integer bd_num) {
		if(bd_num == null || bd_num <= 0)
		return null;
		return boardDao.getBoard(bd_num);
	}

	@Override
	public void registerBoard(BoardVO board, MemberVO user,List<MultipartFile> files) {
		if(board == null || user == null)
			return;
		if(board.getBd_title() == null
				|| board.getBd_title().trim().length() ==0)
			return;	
		if(user.getMe_id() == null 
				|| user.getMe_id().trim().length() ==0)
		return;
		board.setBd_me_id(user.getMe_id());
		boardDao.insertBoard(board);
		
		if(files == null || files.size() == 0)
			return;
		for(MultipartFile tmpFile : files) {
			if(tmpFile != null && tmpFile.getOriginalFilename().length() != 0) {
				try {
					String path = UploadFileUtils.uploadFile(uploadPath, tmpFile.getOriginalFilename(), tmpFile.getBytes());
				 FileVO file = new FileVO(tmpFile.getOriginalFilename(),path,board.getBd_num());
				 boardDao.inserFile(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public BoardVO getBoard(Integer bd_num, MemberVO user) {
		// 게시글이 없는 경우(게시글 번호가 존재하지 않거나 0이하이면) 작업하지 않음
		if(bd_num == null || bd_num <= 0)
			return null;
		// 게시글이 있는 경우 -> 다오에게 게시글 가져오라고 시킴
		BoardVO board = boardDao.getBoard(bd_num);
		// 게시글이 null이거나 작성자와 user 아이디가 다르면 작업하지 않음
		if(board == null || !board.getBd_me_id().equals(user.getMe_id()))
			return null;
		//게시글이 있고 작성자와 user 아이디가 같으면 게시글 수정 화면으로 이동
		return board;
	}

	@Override
	public void updateBoard(BoardVO board, MemberVO user) {
		//다오에게 게시글 번호와 일치하는 게시글을 가져오라고 시킴
		//게시글 = 다오.게시글가져오기(게시글번호)
		BoardVO dbBoard = boardDao.getBoard(board.getBd_num());
		
		//가져온 게시글의 제목과 내용을 board의 제목과 내용으로 덮어쓰기를 함
		dbBoard.setBd_title(board.getBd_title());
		dbBoard.setBd_contents(board.getBd_contents());
		
		//가져온 게시글의 수정일을 현재 시간으로 업데이트 
		dbBoard.setBd_up_date(new Date());
		
		//다오에게 수정된 게시글 정보를 주면서 업데이트 하라고 시킴
		boardDao.updateBoard(dbBoard);
	}

	@Override
	public void deleteBoard(Integer bd_num, MemberVO user) {
		//유효한 번호인지 확인 
			//번호가 null이거나 음수인 경우 삭제할 필요 없음
		if(bd_num == null || bd_num <= 0)
			return;
		//번호와 일치하는 게시글 가져옴 
		BoardVO board = boardDao.getBoard(bd_num);
		//게시글이 없으면 삭제 종료
		if(board == null)
			return;
		//게시글의 작성자(getBd_me_id())와 로그인한 회원 아이디(ser.getMe_id())가 같으면 삭제
		if(user != null && board.getBd_me_id().equals(user.getMe_id()))
			boardDao.deleteBoard(bd_num);
		
	}
		
	}


