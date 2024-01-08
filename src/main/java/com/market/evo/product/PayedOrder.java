package com.market.evo.product;

import java.math.BigDecimal;

import org.codehaus.jackson.annotate.JsonCreator;
import org.codehaus.jackson.annotate.JsonProperty;

public class PayedOrder {

    private BigDecimal p_orderNo;
    private String p_orderID;
    private String p_orderNum;
    private String p_orderName;
    private String p_orderPhone;
    private BigDecimal p_orderAddressNum;
    private String p_orderAddress;
    private String p_productNames;
    private String p_totalAmount;

    @JsonCreator
    public PayedOrder(@JsonProperty("p_orderNo") BigDecimal p_orderNo,
                      @JsonProperty("p_orderID") String p_orderID,
                      @JsonProperty("p_orderNum") String p_orderNum,
                      @JsonProperty("p_orderName") String p_orderName,
                      @JsonProperty("p_orderPhone") String p_orderPhone,
                      @JsonProperty("p_orderAddressNum") BigDecimal p_orderAddressNum,
                      @JsonProperty("p_orderAddress") String p_orderAddress,
                      @JsonProperty("p_productNames") String p_productNames,
                      @JsonProperty("p_totalAmount") String p_totalAmount) {
        this.p_orderNo = p_orderNo;
        this.p_orderID = p_orderID;
        this.p_orderNum = p_orderNum;
        this.p_orderName = p_orderName;
        this.p_orderPhone = p_orderPhone;
        this.p_orderAddressNum = p_orderAddressNum;
        this.p_orderAddress = p_orderAddress;
        this.p_productNames = p_productNames;
        this.p_totalAmount = p_totalAmount;
    }
    
	public BigDecimal getP_orderNo() {
		return p_orderNo;
	}

	public void setP_orderNo(BigDecimal p_orderNo) {
		this.p_orderNo = p_orderNo;
	}

	public String getP_orderID() {
		return p_orderID;
	}

	public void setP_orderID(String p_orderID) {
		this.p_orderID = p_orderID;
	}

	public String getP_orderNum() {
		return p_orderNum;
	}

	public void setP_orderNum(String p_orderNum) {
		this.p_orderNum = p_orderNum;
	}

	public String getP_orderName() {
		return p_orderName;
	}

	public void setP_orderName(String p_orderName) {
		this.p_orderName = p_orderName;
	}

	public String getP_orderPhone() {
		return p_orderPhone;
	}

	public void setP_orderPhone(String p_orderPhone) {
		this.p_orderPhone = p_orderPhone;
	}

	public BigDecimal getP_orderAddressNum() {
		return p_orderAddressNum;
	}

	public void setP_orderAddressNum(BigDecimal p_orderAddressNum) {
		this.p_orderAddressNum = p_orderAddressNum;
	}

	public String getP_orderAddress() {
		return p_orderAddress;
	}

	public void setP_orderAddress(String p_orderAddress) {
		this.p_orderAddress = p_orderAddress;
	}

	public String getP_productNames() {
		return p_productNames;
	}

	public void setP_productNames(String p_productNames) {
		this.p_productNames = p_productNames;
	}

	public String getP_totalAmount() {
		return p_totalAmount;
	}

	public void setP_totalAmount(String p_totalAmount) {
		this.p_totalAmount = p_totalAmount;
	}
	
	
	
	
}
