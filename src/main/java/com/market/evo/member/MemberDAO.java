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
			// 주소처리
			
			int m_address_num = Integer.parseInt(req.getParameter("m_address1"));
			String m_address_kor = req.getParameter("m_address2") + req.getParameter("m_address3");
			m.setM_address_num(m_address_num);
			m.setM_address_kor(m_address_kor);

			if (ss.getMapper(MemberMapper.class).Signup(m) == 1) {
				req.setAttribute("r", "회원가입 성공");
			} else {
				System.out.println("통과못함");

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "회원가입 실패");
		}
	}

	public void GetIDForLogin(Member m, HttpServletRequest req) {
		try {
			List<Member> members = ss.getMapper(MemberMapper.class).GetIDForLogin(m);

			if (members.size() != 0) {
				Member dbM = members.get(0);
				if (dbM.getM_password().equals(m.getM_password())) {
					req.setAttribute("r", "로그인 성공");
					req.getSession().setAttribute("loginMember", dbM);
					req.getSession().setMaxInactiveInterval(600);
				} else {
					req.setAttribute("r", "로그인 실패(PW 오류");
				}
			} else {
				req.setAttribute("r", "로그인 실패(ID 없음)");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "로그인 실패(DB 서버)");
		}
	}

}
