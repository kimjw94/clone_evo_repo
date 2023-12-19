package com.market.evo.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductController {

	@Autowired
	ProductDAO pDAO;

	@RequestMapping(value = "/product.viewAddProduct", method = RequestMethod.GET)
	public String viewAddProduct(HttpServletRequest req) {
		pDAO.getCategoryName(req);
		req.setAttribute("cp", "product/addProducts.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.getDetailCategory", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> detailCategory(HttpServletRequest req, @RequestParam int categoryCode) {
		List<Map<String, Object>> list = pDAO.getDetailCateName(req, categoryCode);

		return list;
	}

	@RequestMapping(value = "/product.addProduct", method = RequestMethod.POST)
	public String addProduct(HttpServletRequest req, Product p) {
		pDAO.addProduct(p, req);
		pDAO.idViewProduct(req);
		req.setAttribute("cp", "product/infoProduct.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.infoProduct", method = RequestMethod.GET)
	public String infoProduct(HttpServletRequest req) {
		pDAO.idViewProduct(req);
		req.setAttribute("cp", "product/infoProduct.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/product.detailProduct", method=RequestMethod.GET)
	public String detailPro(HttpServletRequest req, @RequestParam("p_product_no") int p_product_no) {
		pDAO.detailProduct(req, p_product_no);
		req.setAttribute("cp", "product/detailProduct.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.modiProduct.go", method = RequestMethod.GET)
	public String modiProduct(HttpServletRequest req) {
		req.setAttribute("cp", "product/modiProduct.jsp");
		return "index";
	}
	

	@RequestMapping(value="/product.showProduct.all", method=RequestMethod.GET)
	public String showProductByCategory(HttpServletRequest req, @RequestParam("categoryName") String categoryName) {
		pDAO.getProductsWithImagebyCategory(req,categoryName);
		req.setAttribute("cp", "product/showProductByCategory.jsp");
		return "index";
	}
	@RequestMapping(value="/product.showProduct.detailCategory", method=RequestMethod.GET)
	public String showProductbyCategoryDetail(HttpServletRequest req, @RequestParam("categoryDetailName") String categoryDetailName) {
		pDAO.getProductswithImagebyDetailCategory(req,categoryDetailName);
		req.setAttribute("cp", "product/showProductByDetailCategory.jsp");
		return "index";
	}
	
	@RequestMapping(value="/product.showProduct.detail",method=RequestMethod.GET)
	public String showProductDetail(HttpServletRequest req,@RequestParam("productNo") String productNo) {
		pDAO.getProductDetail(req, productNo);
		req.setAttribute("cp","product/ProductDetail.jsp");
		return "index";
	}
		
}
