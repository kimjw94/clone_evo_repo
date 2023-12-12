package com.market.evo.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductController {
	
	@Autowired
	ProductDAO pDAO;
	
	@RequestMapping(value="/product.viewAddProduct", method = RequestMethod.GET)
	public String viewAddProduct(HttpServletRequest req) {
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
	
	@RequestMapping(value="/product.addProduct", method=RequestMethod.POST)
	public String addProduct(HttpServletRequest req, Product p) {
		pDAO.addProduct(p, req);
		req.setAttribute("cp", "product/infoProduct.jsp");
		return "index";
	}
	
	
	@RequestMapping(value="/product.infoProduct", method=RequestMethod.GET)
	public String infoProduct(HttpServletRequest req, String p_m_id) {
		pDAO.idViewProduct(req, p_m_id);
		req.setAttribute("cp", "product/infoProduct.jsp");
		return "index";
	}
	
	@RequestMapping(value="/product.showAll",method=RequestMethod.GET)
	public String viewProducts(Product p,HttpServletRequest req) {
		pDAO.viewProducts(p, req);
		req.setAttribute("cp", "product/productView.jsp");
		return "index";
	}
}
