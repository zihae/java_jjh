package kr.green.green.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.green.vo.MemberVO;

public interface MemberDAO {

		 void insertMember(@Param("user")MemberVO user);
}
