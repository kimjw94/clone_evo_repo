package com.market.evo.product;

import java.math.BigDecimal;

import org.codehaus.jackson.annotate.JsonCreator;
import org.codehaus.jackson.annotate.JsonProperty;

public class ProductOrder_NonMember {
	private BigDecimal NOrder_productNo;
	private String NOrder_cookieID;
	private String NOrder_productName;
	private String NOrder_productColor;
	private String NOrder_productSize;
	private int NOrder_productQuantity;
	private BigDecimal NOrder_productPrice;

	@JsonCreator
	public ProductOrder_NonMember(@JsonProperty("NOrder_productNo") String NOrder_productNo,
			@JsonProperty("NOrder_cookieID") String NOrder_cookieID,
			@JsonProperty("NOrder_productName") String NOrder_productName,
			@JsonProperty("NOrder_productColor") String NOrder_productColor,
			@JsonProperty("NOrder_productSize") String NOrder_productSize,
			@JsonProperty("NOrder_productQuantity") int NOrder_productQuantity,
			@JsonProperty("NOrder_productPrice") BigDecimal NOrder_productPrice) {
		// Convert the string to BigDecimal or handle the conversion error appropriately
		this.NOrder_productNo = new BigDecimal(NOrder_productNo);
		this.NOrder_cookieID = NOrder_cookieID;
		this.NOrder_productName = NOrder_productName;
		this.NOrder_productColor = NOrder_productColor;
		this.NOrder_productSize = NOrder_productSize;
		this.NOrder_productQuantity = NOrder_productQuantity;
		this.NOrder_productPrice = NOrder_productPrice;
	}

	public BigDecimal getNOrder_productNo() {
		return NOrder_productNo;
	}

	public void setNOrder_productNo(BigDecimal NOrder_productNo) {
		this.NOrder_productNo = NOrder_productNo;
	}

	public String getNOrder_cookieID() {
		return NOrder_cookieID;
	}

	public void setNOrder_cookieID(String NOrder_cookieID) {
		this.NOrder_cookieID = NOrder_cookieID;
	}

	public String getNOrder_productName() {
		return NOrder_productName;
	}

	public void setNOrder_productName(String NOrder_productName) {
		this.NOrder_productName = NOrder_productName;
	}

	public String getNOrder_productColor() {
		return NOrder_productColor;
	}

	public void setNOrder_productColor(String NOrder_productColor) {
		this.NOrder_productColor = NOrder_productColor;
	}

	public String getNOrder_productSize() {
		return NOrder_productSize;
	}

	public void setNOrder_productSize(String NOrder_productSize) {
		this.NOrder_productSize = NOrder_productSize;
	}

	public int getNOrder_productQuantity() {
		return NOrder_productQuantity;
	}

	public void setNOrder_productQuantity(int NOrder_productQuantity) {
		this.NOrder_productQuantity = NOrder_productQuantity;
	}

	public BigDecimal getNOrder_productPrice() {
		return NOrder_productPrice;
	}

	public void setNOrder_productPrice(BigDecimal NOrder_productPrice) {
		this.NOrder_productPrice = NOrder_productPrice;
	}
}