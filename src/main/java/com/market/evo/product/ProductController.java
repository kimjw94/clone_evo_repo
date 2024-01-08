package com.market.evo.product;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@RequestMapping(value = "/product.getCategory", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> detailCategory(HttpServletRequest req) {
		List<Map<String, Object>> list = pDAO.getCategoryName(req);
		
		return list;
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

	@RequestMapping(value = "/product.detailProduct", method = RequestMethod.GET)
	public String detailPro(HttpServletRequest req, @RequestParam("p_product_no") int p_product_no) {
		pDAO.detailProduct(req, p_product_no);
		req.setAttribute("cp", "product/detailProduct.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.modiProduct", method = RequestMethod.POST)
	public String modiProduct(HttpServletRequest req, Product p) {
		int pro_no = pDAO.updateProduct(p, req);
		pDAO.detailProduct(req, pro_no);
		req.setAttribute("cp", "product/detailProduct.jsp");
		return "index";
	}
	

	@RequestMapping(value="/product.originalInven", method=RequestMethod.POST)
	@ResponseBody
	public String getOriginalInven(HttpServletRequest req, @RequestBody Map<String, Object> originInven) {
		pDAO.getOriginalInven(req, originInven);
		
		return "success";
	}
	
	@RequestMapping(value="/product.updateInven", method=RequestMethod.POST)
	@ResponseBody
	public String updateProInven(HttpServletRequest req, @RequestBody Map<String, Object> inven) {
		pDAO.updateProInven(req, inven);
		
		return "success";
	}
	
	@RequestMapping(value="/product.deleteProduct", method=RequestMethod.POST)
	public String deleteProduct(HttpServletRequest req) {
		pDAO.deleteProduct(req);
		pDAO.idViewProduct(req);
		req.setAttribute("cp", "product/infoProduct.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.showProduct.all", method = RequestMethod.GET)
	public String showProductByCategory(HttpServletRequest req, @RequestParam("categoryName") String categoryName) {
		pDAO.getProductsWithImagebyCategory(req, categoryName);
		req.setAttribute("cp", "product/showProductByCategory.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.showProduct.detailCategory", method = RequestMethod.GET)
	public String showProductbyCategoryDetail(HttpServletRequest req,
			@RequestParam("categoryDetailName") String categoryDetailName) {
		pDAO.getProductswithImagebyDetailCategory(req, categoryDetailName);
		req.setAttribute("cp", "product/showProductByDetailCategory.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.showProduct.detail", method = RequestMethod.GET)
	public String showProductDetail(HttpServletRequest req, @RequestParam("productNo") String productNo) {
		pDAO.getProductDetail(req, productNo);
		req.setAttribute("cp", "product/ProductDetail.jsp");
		return "index";
	}

	@RequestMapping(value = "/product.order/nonmember", method = RequestMethod.POST)
	@ResponseBody
	public void orderForNonMember(HttpServletRequest request, HttpServletResponse response, @RequestBody String json) {
		try {
			System.out.println(json);

			ObjectMapper objectMapper = new ObjectMapper();
			nonmember_orderData NOrderList = objectMapper.readValue(json, nonmember_orderData.class);

			// 성공적으로 처리되었을 경우 반환할 값
			List<ProductOrder_NonMember> productOrders = NOrderList.getData();
			pDAO.insertProductOrdersNonMember(productOrders, response);
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("response.nonmember");
		} catch (Exception e) {
			e.printStackTrace();
			try {
				// 오류 상태 코드와 메시지를 클라이언트에게 전송
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				response.getWriter().write("error");
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/product.order/member", method = RequestMethod.POST)
	@ResponseBody
	public void orderForMember(HttpServletRequest request, HttpServletResponse response, @RequestBody String json) {
		try {
			System.out.println(json);

			ObjectMapper objectMapper = new ObjectMapper();
			member_orderData MOrderList = objectMapper.readValue(json, member_orderData.class);

			List<ProductOrder_Member> productOrders = MOrderList.getData();
			pDAO.insertProductOrdersMember(productOrders, response);
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("response.member");

		} catch (Exception e) {
			e.printStackTrace();
			try {
				// 오류 상태 코드와 메시지를 클라이언트에게 전송
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				response.getWriter().write("error");
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
		}
	}



	@RequestMapping(value = "/product.orderlist.nonmember", method = RequestMethod.GET)
	public String orderlistNonmember(HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		String cookieID = null;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("cookieID".equals(cookie.getName())) {
					cookieID = cookie.getValue();
					break;
				
				}
			}
		}
		System.out.println(cookieID);
		pDAO.getProductOrdersByCookieID(req,cookieID);
		req.setAttribute("cp", "product/NoMemberOrder.jsp");
		return "index";
	}


	@RequestMapping(value = "/product.orderlist.member", method = RequestMethod.GET)
	public String orderlistmmember(HttpServletRequest req) {
		pDAO.getProductOrdersbyID(req);
		req.setAttribute("cp", "product/MemberOrder.jsp");
		return "index";
	}
	
	
	@RequestMapping(value="/product.payedorder.nonmember", method=RequestMethod.POST)
	@ResponseBody
	public void payedOrderfromnonmember(HttpServletRequest req,HttpServletResponse rep, @RequestBody String json) {
		try {
			System.out.println(json);
			ObjectMapper objectMapper = new ObjectMapper();
			payedOrderData payedOrder = objectMapper.readValue(json, payedOrderData.class);
			
			List<PayedOrder> payedOrder2 = payedOrder.getData();
			pDAO.insertPayedOrder(payedOrder2, rep);
			rep.setStatus(HttpServletResponse.SC_OK);
			rep.getWriter().write("pay_Success");
		} catch (Exception e) {
			e.printStackTrace();
			try {
				// 오류 상태 코드와 메시지를 클라이언트에게 전송
				rep.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				rep.getWriter().write("pay_Failed");
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
		}
	
	}
	
	@RequestMapping(value="/order_success",method=RequestMethod.GET)
		public String orderSuccess(HttpServletRequest req) {
		req.setAttribute("cp", "product/orderComplete.jsp");
		return "index";
		}
	
}