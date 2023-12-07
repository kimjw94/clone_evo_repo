package com.market.evo.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/loginPage.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "/member.b_info.go", method = RequestMethod.GET)
	public String buyerSignupPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/b_info.jsp"); 
		return "index";
	}
	
	
	@RequestMapping(value = "/member.s_info.go", method = RequestMethod.GET)
	public String sellerSignupPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/s_info.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "member.addressSearch", method = RequestMethod.GET)
	public String addressSearch(HttpServletRequest req) {
		return "member/addressSearch";
	}
	
	@RequestMapping(value = "/member.signup.go", method = RequestMethod.GET)
	public String signupPage(HttpServletRequest req) {
		req.setAttribute("cp", "member/signup.jsp");
		return "index";
	}


	

}
