package com.market.evo.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDAO {

	@Autowired
	SqlSession ss;
	
	public void getCategoryName(HttpServletRequest req) {
		try {
			List<Map<String, Object>> category = ss.getMapper(ProductMapper.class).categoryList();
			
			if(category.size() != 0) {
				req.setAttribute("categoryName", category);
//				for(int i = 0; i < category.size(); i++) {
//					System.out.println(category);
//			}
			} else {
				System.out.println("뭐가없음");
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("db에 문제있음 ㅠ");
		}
	}
	
	public List<Map<String, Object>> getDetailCateName(HttpServletRequest req) {
		try {
			List<Map<String, Object>> dCategory = ss.getMapper(ProductMapper.class).detailCateList();
			
			if(dCategory.size() != 0) {
				req.setAttribute("detailCateName", dCategory);
				for(int i = 0; i < dCategory.size(); i++) {
					System.out.println(dCategory);
				}
				
				return dCategory;
			}
			
			return null;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB에 문제있다!!!");
			return null;
		}
	}
}
