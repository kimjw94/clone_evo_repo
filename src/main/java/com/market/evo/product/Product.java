package com.market.evo.product;

import java.math.BigDecimal;
import java.util.Date;



public class Product {
	private String p_m_id;
	private BigDecimal p_product_no;
	private int p_category_code;
	private int p_price;
	private String p_info;
	private String p_photo;
	private Date p_addDay;
	private BigDecimal p_views;
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Product(String p_m_id, BigDecimal p_product_no, int p_category_code, int p_price, String p_info,
			String p_photo, Date p_addDay, BigDecimal p_views) {
		super();
		this.p_m_id = p_m_id;
		this.p_product_no = p_product_no;
		this.p_category_code = p_category_code;
		this.p_price = p_price;
		this.p_info = p_info;
		this.p_photo = p_photo;
		this.p_addDay = p_addDay;
		this.p_views = p_views;
	}


	public String getP_m_id() {
		return p_m_id;
	}
	public void setP_m_id(String p_m_id) {
		this.p_m_id = p_m_id;
	}
	public BigDecimal getP_product_no() {
		return p_product_no;
	}
	public void setP_product_no(BigDecimal p_product_no) {
		this.p_product_no = p_product_no;
	}
	public int getP_category_code() {
		return p_category_code;
	}
	public void setP_category_code(int p_category_code) {
		this.p_category_code = p_category_code;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	public String getP_photo() {
		return p_photo;
	}
	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}
	public Date getP_addDay() {
		return p_addDay;
	}
	public void setP_addDay(Date p_addDay) {
		this.p_addDay = p_addDay;
	}
	public BigDecimal getP_views() {
		return p_views;
	}
	public void setP_views(BigDecimal p_views) {
		this.p_views = p_views;
	}
	
}