package com.market.evo.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@RequestMapping(value="/signup.buyerorseller",method=RequestMethod.GET)
	public String signupBuyerOrSeller(HttpServletRequest req) {
		req.setAttribute("cp", "member/buyerOrseller.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/loginPage.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "/member.b_signup.go", method = RequestMethod.GET)
	public String buyerSignupPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/b_signup.jsp");
		return "index";
	}
	
//	@RequestMapping(value = "/member.b_signup", method = RequestMethod.POST)
//	public String buyerSignup(Member M, HttpServletRequest req) {
//		mDAO.b_singup(m, req);
//		return "home";
//	}
	
	@RequestMapping(value = "/member.s_signup.go", method = RequestMethod.GET)
	public String sellerSignupPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/s_signup.jsp");
		return "index";
	}
	
//	@RequestMapping(value = "/member.s_signup", method = RequestMethod.POST)
//	public String sellerSignup(Member M, HttpServletRequest req) {
//		mDAO.s_singup(m, req);
//		return "home";
//	}


	

}
