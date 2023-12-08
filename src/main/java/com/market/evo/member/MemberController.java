package com.market.evo.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/loginPage.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "/member.sellerinfo.go", method = RequestMethod.GET)
	public String buyerSignupPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/sellerinfo.jsp"); 
		return "index";
	}
	
	
	@RequestMapping(value = "/member.info.go", method = RequestMethod.GET)
	public String infoPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/info.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "/member.addressSearch", method = RequestMethod.GET)
	public String addressSearch(HttpServletRequest req) {
		return "member/addressSearch";
	}
	
	@RequestMapping(value = "/member.signup.go", method = RequestMethod.GET)
	public String signupPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/signup.jsp");
		return "index";
	}

	@RequestMapping(value="/member.signup",method =RequestMethod.POST)
	public String Signup(Member m, HttpServletRequest req) {
		mDAO.Signup(m, req);
		req.setAttribute("cp", "home.jsp");
		return "index";
		
	}
	@RequestMapping(value="/member.login",method = RequestMethod.POST)
	public String Login(Member m, HttpServletRequest req) {
		mDAO.GetIDForLogin(m, req);
		req.setAttribute("cp","home.jsp");
		return "index";
	}
	

	@RequestMapping(value="/member.sellerInfoModi.go", method = RequestMethod.GET)
	public String sellerInfoModi(HttpServletRequest req) {
		return "member/sellerInfoModi";
	}
	
}
