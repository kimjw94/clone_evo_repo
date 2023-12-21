package com.market.evo.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			mDAO.getCategoryName(req);
			req.setAttribute("cp", "member/helpper.jsp");
		}
		return "index";
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
	
	@RequestMapping(value = "/member.getDetailCategory", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> detailCategory(HttpServletRequest req, @RequestParam int categoryCode) {
		List<Map<String, Object>> list = mDAO.getDetailCateName(req, categoryCode);

		return list;
	}
	
	@RequestMapping(value = "/member.helpper", method = RequestMethod.POST)
	public String cont(Helpper h, HttpServletRequest req) {
		mDAO.cont(h, req);
		req.setAttribute("cp", "home.jsp");
		return "index";
	}
	

	@RequestMapping(value = "/member.helpperList.go", method = RequestMethod.GET)
	public String helpperListGo(@RequestParam(value = "page", defaultValue = "1") int page,
	                          Helpper h, HttpServletRequest req, Model model) {

	    if (req.getSession().getAttribute("loginMember") == null) {
	        return "redirect:/login";
	    } else {
	        // 페이지당 항목 수 설정 (원하는대로 조정)
	        int itemsPerPage = 10;

	        // 전체 항목 수 및 총 페이지 수 계산 로직
	        int totalItems = mDAO.getTotalHelpperCount(); // 이 메서드는 전체 항목 수를 가져오는 메서드여야 합니다.
	        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	        // 페이지에 따른 목록 가져오기
	        List<Helpper> helpperList = mDAO.helpperList(page, itemsPerPage, h, req);

	        model.addAttribute("helpperList", helpperList);
	        model.addAttribute("pageCount", totalPages);
	        model.addAttribute("currentPage", page); // 현재 페이지 정보를 모델에 추가

	        req.setAttribute("cp", "member/helpperList.jsp");
	        return "index";
	    }
	}
	
	@RequestMapping(value = "/member.helpperList", method = RequestMethod.POST)
	public String helpperList(@RequestParam(value = "page", defaultValue = "1") int page,
	                          Helpper h, HttpServletRequest req, Model model) {

	    if (req.getSession().getAttribute("loginMember") == null) {
	        return "redirect:/login";
	    } else {
	        // 페이지당 항목 수 설정 (원하는대로 조정)
	        int itemsPerPage = 10;

	        // 전체 항목 수 및 총 페이지 수 계산 로직
	        int totalItems = mDAO.getTotalHelpperCount(); // 이 메서드는 전체 항목 수를 가져오는 메서드여야 합니다.
	        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	        // 페이지에 따른 목록 가져오기
	        List<Helpper> helpperList = mDAO.helpperList(page, itemsPerPage, h, req);

	        model.addAttribute("helpperList", helpperList);
	        model.addAttribute("pageCount", totalPages);
	        model.addAttribute("currentPage", page); // 현재 페이지 정보를 모델에 추가

	        req.setAttribute("cp", "member/helpperList.jsp");
	        return "index";
	    }
	}
	

}
