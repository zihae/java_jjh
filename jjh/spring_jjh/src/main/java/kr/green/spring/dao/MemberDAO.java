package kr.green.spring.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.spring.vo.MemberVO;

public interface MemberDAO {

	MemberVO getMember(@Param("me_id")String me_id);
	//Select를 제외한 return은 return type이 void
	void insertMember(@Param("user")MemberVO user);
	void updateMember(@Param("user")MemberVO input);
	
	

	

	

}
