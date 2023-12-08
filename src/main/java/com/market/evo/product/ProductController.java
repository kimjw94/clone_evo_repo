package com.market.evo.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	@RequestMapping(value="/addProduct", method = RequestMethod.GET)
	public String addProduct(HttpServletRequest req) {
		req.setAttribute("cp", "product/addProduct.jsp");
		return "index";
	}
}
