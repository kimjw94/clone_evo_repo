package com.market.evo.member;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


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
					req.setAttribute("r", "PW가 잘못되었습니다.");
					
				}
			} else {
				req.setAttribute("r", "ID가 잘못되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "로그인 실패(DB 서버)");
		}
	}

	public void logout(HttpServletRequest req) {
		try {
			req.getSession().setAttribute("loginMember", null);
			req.setAttribute("r", "로그아웃");

		} catch (Exception e) {
			req.setAttribute("r", "로그아웃 실패");

		}
	}

	public void updateMember(Member m, HttpServletRequest req) {

		try {
			m.setM_password(req.getParameter("m_password"));
			m.setM_name(req.getParameter("m_name"));
			m.setM_alias(req.getParameter("m_alias"));
			m.setM_phone(req.getParameter("m_phone"));
			// 주소처리

			int m_address_num = Integer.parseInt(req.getParameter("m_address1"));
			String m_address_kor = req.getParameter("m_address2") + req.getParameter("m_address3");
			m.setM_address_num(m_address_num);
			m.setM_address_kor(m_address_kor);

			if (ss.getMapper(MemberMapper.class).updateMember(m) == 1) {
				req.setAttribute("r", "회원정보 수정");
			} else {
				System.out.println("통과못함");

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "수정 실패");
		}
	}

	public void sellerupdate(Member m, HttpServletRequest req) {

		try {
			m.setM_company_name(req.getParameter("m_company_name"));
			m.setM_account_name(req.getParameter("m_account_name"));
			m.setM_account_number(req.getParameter("m_account_number"));
			// 주소처리

			int m_company_address_num = Integer.parseInt(req.getParameter("m_company_address1"));
			String m_company_address_kor = req.getParameter("m_company_address2")
					+ req.getParameter("m_company_address3");
			m.setM_company_address_num(m_company_address_num);
			m.setM_company_address_kor(m_company_address_kor);

			if (ss.getMapper(MemberMapper.class).sellerupdate(m) == 1) {
				req.setAttribute("r", "회원정보 수정");
			} else {
				System.out.println("통과못함");

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "수정 실패");
		}
	}

	public void delete(HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			if(m.getM_password().equals(req.getParameter("m_password"))) {
				if(ss.getMapper(MemberMapper.class).deleteMember(m) == 1) {
					req.setAttribute("r", "탈퇴 완료");
					req.getSession().setAttribute("loginMember", null);
				}else {
					req.setAttribute("r", "이미 탈퇴됨");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "탈퇴 실패");
		}
	}
	
	public Members memberIdCheck(Member m) {
		return new Members(ss.getMapper(MemberMapper.class).getMemberById(m));
	}
	
	public Members memberalCheck(Member m) {
		return new Members(ss.getMapper(MemberMapper.class).getMemberByAl(m));
	}
	
	public boolean loginCheck(HttpServletRequest req) {
        Member m = (Member) req.getSession().getAttribute("loginMember");
        if(m != null) {
        	return true;
        }else {
        	return false;
        }
	}
	
	public Member searchId(Member m, HttpServletRequest req) {
	    try {
	    	if(req.getSession().getAttribute("foundMember2") != null) {
	        	req.getSession().setAttribute("foundMember2", null);
	        }
	    	
	    	Member searchResult = ss.getMapper(MemberMapper.class).searchId(m);
	        return searchResult;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	public Member searchPw(Member m, HttpServletRequest req) {
	    try {
	        if(req.getSession().getAttribute("foundMember") != null) {
	        	req.getSession().setAttribute("foundMember", null);
	        }
	    	
	    	Member searchResult = ss.getMapper(MemberMapper.class).searchId(m);
	        return searchResult;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	//고객센터 쪽
	public void getCategoryName(HttpServletRequest req) {
		try {
			List<Map<String, Object>> category = ss.getMapper(MemberMapper.class).categoryList();

			if (category.size() != 0) {
				req.setAttribute("categoryName", category);
			} else {
				System.out.println("뭐가없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db에 문제있음 ㅠ");
		}
	}
	
	public List<Map<String, Object>> getDetailCateName(HttpServletRequest req, int categoryCode) {
		try {

			List<Map<String, Object>> dCategory = ss.getMapper(MemberMapper.class).detailCateList(categoryCode);

			if (dCategory.size() != 0) {
				req.setAttribute("detailCateName", dCategory);

				return dCategory;
			}

			return null;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB에 문제있다!!!");
			return null;
		}
	}
	
	public void cont(Helpper h, HttpServletRequest req) {
	    
		String path1 = null;
		
		String infoName1 = null;
		
		MultipartRequest mr = null;
		
		
		
		try {
	        path1 = req.getSession().getServletContext().getRealPath("/resources/helpperImage/");
//	        System.out.println("상품 사진 : " + path1);

	        File folder = new File(path1);
	        if (!folder.exists()) {
	            try {
	            	folder.mkdir();
		            System.out.println("상품사진 폴더가 생성되었습니다.");
				} catch (Exception e) {
					e.printStackTrace();
				}
	        	
	        }
	        
	        mr = new MultipartRequest(req, path1, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
	        
	        try {
	        	infoName1 = mr.getFilesystemName("imageFile");
	        	System.out.println(infoName1);
	        	if (infoName1 != null) {
	                String renamedFileName = renameFile(infoName1);
	                File oldFile = new File(path1, infoName1);
	                File newFile = new File(path1, renamedFileName);
	                if (oldFile.renameTo(newFile)) {
	                    req.setAttribute("r", "파일 이름이 변경되었습니다.");
	                    h.setImageFileName(renamedFileName);
	                    
	                    saveFile(newFile);
	                } else {
	                	req.setAttribute("r", "파일 이름이 변경이 실패했습니다.");
	                }
	            }
	        	
			} catch (Exception e) {
				
			}
	        
	        Member m = (Member) req.getSession().getAttribute("loginMember");
	        
	        h.setH_m_id(m.getM_id());
	        h.setH_title(mr.getParameter("h_title"));
	        h.setH_cont(mr.getParameter("h_cont"));
	        h.setH_category(mr.getParameter("h_category"));
	        h.setH_category_code(mr.getParameter("h_category_code"));
	        
//	        System.out.println(h.getH_num());
//	        System.out.println(h.getH_m_id());
//	        System.out.println(h.getH_title());
//	        System.out.println(h.getH_cont());
//	        System.out.println(h.getH_category());
//	        System.out.println(h.getH_category_code());
	        


	        // Inquiry 테이블에 데이터 삽입
	        if(ss.getMapper(MemberMapper.class).cont(h)==1) {
	        	req.setAttribute("r", "문의하기 완료");
	        }else {
	        	System.out.println("작성하기 실패");
	        }
	        
	        

	    } catch (Exception e) {
	        e.printStackTrace();
	        
	    }
		
	}
	private String renameFile(String fileName) {
	    String baseName = FilenameUtils.getBaseName(fileName);
	    String extension = FilenameUtils.getExtension(fileName);
	    String timeStamp = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
	    
//	    System.out.println("Base Name: " + baseName);
//	    System.out.println("Extension: " + extension);
//	    System.out.println("Time Stamp: " + timeStamp);
	    
	    return baseName + "_" + timeStamp + "." + extension;
	}
	
	private void saveFile(File file) {
	    
	    System.out.println("파일 저장 중: " + file.getAbsolutePath());
	}
	
}

