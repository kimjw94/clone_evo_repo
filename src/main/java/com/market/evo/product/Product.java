package com.market.evo.product;

import java.math.BigDecimal;

import oracle.sql.DATE;

public class Product {
	private BigDecimal p_serialNum;
	private BigDecimal p_productNum;
	private int p_categoryCode;
	private int p_price;
	private String p_info;
	private String p_photo;
	private DATE p_addDay;
	private BigDecimal p_views;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Product(BigDecimal p_serialNum, BigDecimal p_productNum, int p_categoryCode, int p_price, String p_info,
			String p_photo, DATE p_addDay, BigDecimal p_views) {
		super();
		this.p_serialNum = p_serialNum;
		this.p_productNum = p_productNum;
		this.p_categoryCode = p_categoryCode;
		this.p_price = p_price;
		this.p_info = p_info;
		this.p_photo = p_photo;
		this.p_addDay = p_addDay;
		this.p_views = p_views;
	}
	
	
	public BigDecimal getP_serialNum() {
		return p_serialNum;
	}
	public void setP_serialNum(BigDecimal p_serialNum) {
		this.p_serialNum = p_serialNum;
	}
	public BigDecimal getP_productNum() {
		return p_productNum;
	}
	public void setP_productNum(BigDecimal p_productNum) {
		this.p_productNum = p_productNum;
	}
	public int getP_categoryCode() {
		return p_categoryCode;
	}
	public void setP_categoryCode(int p_categoryCode) {
		this.p_categoryCode = p_categoryCode;
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
	public DATE getP_addDay() {
		return p_addDay;
	}
	public void setP_addDay(DATE p_addDay) {
		this.p_addDay = p_addDay;
	}
	public BigDecimal getP_views() {
		return p_views;
	}
	public void setP_views(BigDecimal p_views) {
		this.p_views = p_views;
	}
}
