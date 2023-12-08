package com.market.evo.member;


public class Member {
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_alias;
	private String m_phone;
	private int m_address_num;
	private String m_address_kor;
	private int m_buy_sell;
	private String m_company_name;
	private int m_company_address_num;
	private String m_company_address_kor;
	private String m_account_name;
	private String m_account_number;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String m_id, String m_password, String m_name, String m_alias, String m_phone, int m_address_num,
			String m_address_kor, int m_buy_sell, String m_company_name, int m_company_address_num,
			String m_company_address_kor, String m_account_name, String m_account_number, int m_serial_no) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_alias = m_alias;
		this.m_phone = m_phone;
		this.m_address_num = m_address_num;
		this.m_address_kor = m_address_kor;
		this.m_buy_sell = m_buy_sell;
		this.m_company_name = m_company_name;
		this.m_company_address_num = m_company_address_num;
		this.m_company_address_kor = m_company_address_kor;
		this.m_account_name = m_account_name;
		this.m_account_number = m_account_number;
		
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_alias() {
		return m_alias;
	}

	public void setM_alias(String m_alias) {
		this.m_alias = m_alias;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public int getM_address_num() {
		return m_address_num;
	}

	public void setM_address_num(int m_address_num) {
		this.m_address_num = m_address_num;
	}

	public String getM_address_kor() {
		return m_address_kor;
	}

	public void setM_address_kor(String m_address_kor) {
		this.m_address_kor = m_address_kor;
	}

	public int getM_buy_sell() {
		return m_buy_sell;
	}

	public void setM_buy_sell(int m_buy_sell) {
		this.m_buy_sell = m_buy_sell;
	}

	public String getM_company_name() {
		return m_company_name;
	}

	public void setM_company_name(String m_company_name) {
		this.m_company_name = m_company_name;
	}

	public int getM_company_address_num() {
		return m_company_address_num;
	}

	public void setM_company_address_num(int m_company_address_num) {
		this.m_company_address_num = m_company_address_num;
	}

	public String getM_company_address_kor() {
		return m_company_address_kor;
	}

	public void setM_company_address_kor(String m_company_address_kor) {
		this.m_company_address_kor = m_company_address_kor;
	}

	public String getM_account_name() {
		return m_account_name;
	}

	public void setM_account_name(String m_account_name) {
		this.m_account_name = m_account_name;
	}

	public String getM_account_number() {
		return m_account_number;
	}

	public void setM_account_number(String m_account_number) {
		this.m_account_number = m_account_number;
	}
	
}