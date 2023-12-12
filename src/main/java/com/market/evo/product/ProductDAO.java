package com.market.evo.product;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.market.evo.member.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ProductDAO {

	@Autowired
	SqlSession ss;
	
	// 카테고리
	public void getCategoryName(HttpServletRequest req) {
		try {
			List<Map<String, Object>> category = ss.getMapper(ProductMapper.class).categoryList();
			
			if(category.size() != 0) {
				req.setAttribute("categoryName", category);
			} else {
				System.out.println("뭐가없음");
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("db에 문제있음 ㅠ");
		}
	}
	
	// 세부카테고리
	public List<Map<String, Object>> getDetailCateName(HttpServletRequest req, int categoryCode) {
		try {
			
			
			List<Map<String, Object>> dCategory = ss.getMapper(ProductMapper.class).detailCateList(categoryCode);
			
			
			if(dCategory.size() != 0) {
				req.setAttribute("detailCateName", dCategory);
				
				return dCategory;
			}
			
			return null;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB에 문제있다!!!");
			return null;
		}
	}
	
	// 상품추가
	public void addProduct(Product p, HttpServletRequest req) {

		MultipartRequest mr = null;
		String path = null; 
		
		try {		
			
			path = req.getSession().getServletContext().getRealPath("resources/productImg");
			System.out.println(path);
			
			path = "c:\\upload\\";
			
			File folder = new File(path);
			
			// 폴더 존재 여부
			if(!folder.exists()) {
				try {
					folder.mkdir();
					System.out.println("upload 폴더가 생성되었습니다.");
				} catch(Exception e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("폴더있어요");
			}
			
			mr = new MultipartRequest(req, path, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());	
			
			
			
			try {
				
				Member m = (Member)req.getSession().getAttribute("loginMember");
				
				p.setP_m_id(m.getM_id());
				p.setP_product_name(mr.getParameter("p_product_name"));
				p.setP_info(mr.getParameter("p_info"));
			
				int p_category_code = Integer.parseInt(mr.getParameter("p_category_code"));
				p.setP_category_code(p_category_code);

				int p_price = Integer.parseInt(mr.getParameter("p_price"));
				p.setP_price(p_price);
				
			
				String p_photo = mr.getFilesystemName("p_photo");
				String p_photo_kor = URLEncoder.encode(p_photo, "UTF-8").replace("+", " ");
				p.setP_photo(p_photo_kor);
				
				if(ss.getMapper(ProductMapper.class).addProduct(p) == 1) {
					req.setAttribute("r", "상품 추가 -완-");
					System.out.println("상품추가완!!");
				}
			} catch(Exception e) {
				e.printStackTrace();
				File f = new File(path + "/" + mr.getFilesystemName("p_photo"));
				f.delete();
				System.out.println("DB 에러! 이미지 파일 삭제했습니다.");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("사진 용량이 너무 커요");
			return;
		}
	}
	
	// 판매자가 추가한 상품만 모아보기
	public void idViewProduct(HttpServletRequest req, String p_m_id) {
		try {

			Member m = (Member)req.getSession().getAttribute("loginMember");
			p_m_id = m.getM_id();
			
			List<Map<String, String>> pl = ss.getMapper(ProductMapper.class).idViewProduct(p_m_id);
			
			if(pl.size() != 0) {

				req.setAttribute("idProduct", pl);
				req.setAttribute("p", "");
				

			} else {
				System.out.println("등록한 상품이 없어요");
				req.setAttribute("p", "등록한 상품이 없습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace();
		
		}
	}
}
