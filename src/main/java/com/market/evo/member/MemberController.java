package com.market.evo.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mDAO;

//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String loginPage(HttpServletRequest req) {
//		req.setAttribute("cp", "member/loginPage.jsp");
//		return "index";
//	}

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

	@RequestMapping(value = "/member.signup", method = RequestMethod.POST)
	public String Signup(Member m, HttpServletRequest req) {
		mDAO.Signup(m, req);
		req.setAttribute("cp", "home.jsp");
		return "index";

	}

	@RequestMapping(value = "/member.login", method = RequestMethod.POST)
	public String login(Member m, HttpServletRequest req) {
		// MemberDAO에서 로그인 처리를 수행하는 GetIDForLogin 메서드 호출
		
		mDAO.GetIDForLogin(m, req);
		boolean loginSuccess = mDAO.loginCheck(req);
		
		if (loginSuccess) {
			// 로그인 성공 후 home.jsp로 이동하기 위해 cp 속성을 설정
			
			return "redirect:/home";
		
		} else {
			// 로그인 실패 시 실패 메시지를 설정
			req.setAttribute("cp", "member/loginPage.jsp");
			
		}
		return "index";
		
	}

	@RequestMapping(value = "/member.sellerInfoModi.go", method = RequestMethod.GET)
	public String sellerInfoModi(HttpServletRequest req) {
		return "member/sellerInfoModi";
	}

	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage(HttpServletRequest req) {

		req.setAttribute("cp", "member/myPage.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.logout", method = RequestMethod.GET)
	public String memberLogout(HttpServletRequest req) {
		mDAO.logout(req);
		req.setAttribute("cp", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.updateMember", method = RequestMethod.POST)
	public String updateMember(Member m, HttpServletRequest req) {
		mDAO.updateMember(m, req);
		req.setAttribute("cp", "home.jsp");
		return "index";

	}

	@RequestMapping(value = "/member.sellerupdate", method = RequestMethod.POST)
	public String sellerupdate(Member m, HttpServletRequest req) {
		mDAO.sellerupdate(m, req);
		req.setAttribute("cp", "home.jsp");
		return "index";

	}

	@RequestMapping(value = "/member.deletMember.go", method = RequestMethod.GET)
	public String deletMemberGo(HttpServletRequest req) {
		req.setAttribute("cp", "member/deletMember.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.deletMember", method = RequestMethod.POST)
	public String deletMember(HttpServletRequest req) {
		mDAO.delete(req);
		req.setAttribute("cp", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/member.idCheck", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public @ResponseBody Members memberIdCheck(Member m) {
		return mDAO.memberIdCheck(m);
	}

	@RequestMapping(value = "/member.alCheck", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public @ResponseBody Members memberalCheck(Member m) {
		return mDAO.memberalCheck(m);
	}
  
	@RequestMapping(value = "/member.searchId.go", method = RequestMethod.GET)
	public String searchIdgo(HttpServletRequest req) {
		req.setAttribute("cp", "member/searchId.jsp");
		return "index";
	}


	@RequestMapping(value = "/member.searchId", method = RequestMethod.POST)
	public String searchId(Member m, HttpServletRequest req) {
		Member foundMember = mDAO.searchId(m, req);

		if (foundMember != null) {
			req.setAttribute("foundMember", foundMember);
			req.getSession().setAttribute("foundMember", foundMember);
			req.setAttribute("cp", "member/searchResult.jsp");
		} else {
			req.setAttribute("r", "아이디를 찾을 수 없습니다.");
			req.setAttribute("cp", "member/searchResult.jsp");
		}

		return "index";
	}


	@RequestMapping(value = "/member.searchPw.go", method = RequestMethod.GET)
	public String searchPwgo(HttpServletRequest req) {
		req.setAttribute("cp", "member/searchPw.jsp");
		return "index";
	}


	@RequestMapping(value = "/member.searchPw", method = RequestMethod.POST)
	public String searchPw(Member m, HttpServletRequest req) {
		Member foundMember2 = mDAO.searchPw(m, req);

		if (foundMember2 != null) {
			req.setAttribute("foundMember2", foundMember2);
			req.getSession().setAttribute("foundMember2", foundMember2);
			req.setAttribute("cp", "member/searchResult.jsp");
		} else {
			req.setAttribute("r", "비밀번호를 찾을 수 없습니다.");
			req.setAttribute("cp", "member/searchResult.jsp");
		}

		return "index";
	}

	@RequestMapping(value = "/member.helpper.go", method = RequestMethod.GET)
	public String helpper(HttpServletRequest req) {
		if (req.getSession().getAttribute("loginMember") == null) {

			return "redirect:/login";
		} else {
			req.setAttribute("cp", "member/helpper.jsp");
		}
		return "index";
	}

	@RequestMapping(value = "/member.helpperList.go", method = RequestMethod.GET)
	public String helpperList(HttpServletRequest req) {
		if (req.getSession().getAttribute("loginMember") == null) {

			return "redirect:/login";
		} else {

			req.setAttribute("cp", "member/helpperList.jsp");
			return "index";
		}
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homePage(HttpServletRequest req) {
		req.setAttribute("cp", "home.jsp");
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpServletRequest req) {
		// 현재 페이지 주소를 세션에 저장
		String referer = req.getHeader("Referer");
		req.getSession().setAttribute("prevPage", referer);

		req.setAttribute("cp", "member/loginPage.jsp");
		return "index";
	}

//	@RequestMapping(value = "/member.login", method = RequestMethod.POST)
//	public String login(Member m, HttpServletRequest req) {
//		// 로그인 처리 로직
//		mDAO.GetIDForLogin(m, req);
//		boolean loginSuccess = mDAO.loginCheck(req);
//		String prevPage = (String) req.getSession().getAttribute("prevPage");
//		if (loginSuccess) {
//			// 성공 시 이전 페이지로 리다이렉트
//			
//			if (prevPage != null) {
//				req.getSession().removeAttribute("prevPage");
//				return "redirect:" + prevPage;
//			} else {
//				// 이전 페이지 정보가 없으면 홈페이지로 리다이렉트 또는 다른 처리 수행
//				req.setAttribute("cp", "home.jsp");
//				return "index";
//			}
//			
//		}
//		return "index";
//
//	}
}
