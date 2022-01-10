package kr.green.green.dao;

import org.apache.ibatis.annotations.Param;

public interface MemberDAO {

	    public String getMember(@Param("me_id")String me_id);
}
