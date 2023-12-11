package com.market.evo.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductController {
	
	@Autowired
	ProductDAO pDAO;
	
	@RequestMapping(value="/product.addProduct", method = RequestMethod.GET)
	public String addProduct(HttpServletRequest req) {
		pDAO.getCategoryName(req);
		req.setAttribute("cp", "product/addProduct.jsp");
		return "index";
	}
	
	@RequestMapping(value="/product.getDetailCategory", method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> detailCategory(HttpServletRequest req, @RequestParam int categoryCode) {
		List<Map<String, Object>> list = pDAO.getDetailCateName(req, categoryCode);
		
		return list;
	}
	
}
