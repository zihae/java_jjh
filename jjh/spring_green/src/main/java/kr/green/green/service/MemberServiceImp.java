package kr.green.green.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.green.green.dao.MemberDAO;

public class MemberServiceImp implements MemberService {
	@Autowired
    MemberDAO memberDao;
    
    @Override
    public String getMember(String me_id) {
        return memberDao.getMember(me_id);
    }

}
