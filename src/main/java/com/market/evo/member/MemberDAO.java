package com.market.evo.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;

	public void Signup(Member m, HttpServletRequest req) {
		try {
		//주소처리 
		int m_address_num = Integer.parseInt(req.getParameter("m_address1"));
		String m_address_kor = req.getParameter("m_address2") + req.getParameter("m_address3");
		
		
		if(ss.getMapper(MemberMapper.class).Signup(m)==1) {
			req.setAttribute("r", "회원가입 성공");
		}
		}catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "회원가입 실패");
		}
		
		

	}
}	
