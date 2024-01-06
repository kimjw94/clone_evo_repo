package com.market.evo.product;

import java.math.BigDecimal;

import org.codehaus.jackson.annotate.JsonCreator;
import org.codehaus.jackson.annotate.JsonProperty;

public class ProductOrder_Member {
	private BigDecimal memberOrder_productNo;
	private String memberOrder_memberId;
	private String memberOrder_productName;
	private String memberOrder_productColor;
	private String memberOrder_productSize;
	private int memberOrder_productQuantity;
	private BigDecimal memberOrder_productPrice;

	@JsonCreator
	public ProductOrder_Member(@JsonProperty("memberOrder_productNo") String memberOrder_productNo,
			@JsonProperty("memberOrder_memberId") String memberOrder_memberId,
			@JsonProperty("memberOrder_productName") String memberOrder_productName,
			@JsonProperty("memberOrder_productColor") String memberOrder_productColor,
			@JsonProperty("memberOrder_productSize") String memberOrder_productSize,
			@JsonProperty("memberOrder_productQuantity") int memberOrder_productQuantity,
			@JsonProperty("memberOrder_productPrice") BigDecimal memberOrder_productPrice) {
		this.memberOrder_productNo = new BigDecimal(memberOrder_productNo);
		this.memberOrder_memberId = memberOrder_memberId;
		this.memberOrder_productName = memberOrder_productName;
		this.memberOrder_productColor = memberOrder_productColor;
		this.memberOrder_productSize = memberOrder_productSize;
		this.memberOrder_productQuantity = memberOrder_productQuantity;
		this.memberOrder_productPrice = memberOrder_productPrice;
	}

	public BigDecimal getMemberOrder_productNo() {
		return memberOrder_productNo;
	}

	public void setMemberOrder_productNo(BigDecimal memberOrder_productNo) {
		this.memberOrder_productNo = memberOrder_productNo;
	}

	public String getMemberOrder_memberId() {
		return memberOrder_memberId;
	}

	public void setMemberOrder_memberId(String memberOrder_memberId) {
		this.memberOrder_memberId = memberOrder_memberId;
	}

	public String getMemberOrder_productName() {
		return memberOrder_productName;
	}

	public void setMemberOrder_productName(String memberOrder_productName) {
		this.memberOrder_productName = memberOrder_productName;
	}

	public String getMemberOrder_productColor() {
		return memberOrder_productColor;
	}

	public void setMemberOrder_productColor(String memberOrder_productColor) {
		this.memberOrder_productColor = memberOrder_productColor;
	}

	public String getMemberOrder_productSize() {
		return memberOrder_productSize;
	}

	public void setMemberOrder_productSize(String memberOrder_productSize) {
		this.memberOrder_productSize = memberOrder_productSize;
	}

	public int getMemberOrder_productQuantity() {
		return memberOrder_productQuantity;
	}

	public void setMemberOrder_productQuantity(int memberOrder_productQuantity) {
		this.memberOrder_productQuantity = memberOrder_productQuantity;
	}

	public BigDecimal getMemberOrder_productPrice() {
		return memberOrder_productPrice;
	}

	public void setMemberOrder_productPrice(BigDecimal memberOrder_productPrice) {
		this.memberOrder_productPrice = memberOrder_productPrice;
	}

}