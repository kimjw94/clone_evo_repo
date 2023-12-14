package com.market.evo.product;

import java.math.BigDecimal;
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

	@RequestMapping(value = "/product.viewAddProduct", method = RequestMethod.GET)
	public String viewAddProduct(HttpServletRequest req) {
		pDAO.getCategoryName(req);
		req.setAttribute("cp", "product/addProduct.jsp");
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

	@RequestMapping(value = "/product.showAll", method = RequestMethod.GET)
	public String viewProducts(Product p, HttpServletRequest req) {
		pDAO.viewProducts(p, req);
		req.setAttribute("cp", "product/productView.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.modiProduct.go", method = RequestMethod.GET)
	public String modiProduct(HttpServletRequest req) {
		req.setAttribute("cp", "product/modiProduct.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.viewDetail", method = RequestMethod.GET)
	public String viewProductDetail(HttpServletRequest req, @RequestParam("p_product_no") BigDecimal p_product_no) {
	    // 여기서 p_product_no를 통해 해당 상품 정보를 가져와서 req에 저장하고, 상세페이지로 이동
	    // 상품 정보 가져오는 코드 작성
	    Product product = pDAO.getProductByProductNo(p_product_no);
	    req.setAttribute("product", product);
	    req.setAttribute("cp", "product/productDetail.jsp");
	    return "index";
}
	
	@RequestMapping(value="/product.showUpperWear",method=RequestMethod.GET)
	public String viewProuctsUpperWear(HttpServletRequest req) {
		pDAO.getUpperWearProducts(req);
		req.setAttribute("cp", "product/productAllUpperWearView.jsp");
		return "index";
	}
	
}
