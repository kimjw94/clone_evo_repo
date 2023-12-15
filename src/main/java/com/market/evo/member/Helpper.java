package com.market.evo.member;

public class Helpper {
	private int h_num;
	private String h_m_id;
	private String h_title;
	private String h_cont;
	
	public Helpper() {
    }

	public Helpper(int h_num, String h_m_id, String h_title, String h_cont) {
		super();
		this.h_num = h_num;
		this.h_m_id = h_m_id;
		this.h_title = h_title;
		this.h_cont = h_cont;
	}

	public int getH_num() {
		return h_num;
	}

	public void setH_num(int h_num) {
		this.h_num = h_num;
	}

	public String getH_m_id() {
		return h_m_id;
	}

	public void setH_m_id(String h_m_id) {
		this.h_m_id = h_m_id;
	}

	public String getH_title() {
		return h_title;
	}

	public void setH_title(String h_title) {
		this.h_title = h_title;
	}

	public String getH_cont() {
		return h_cont;
	}

	public void setH_cont(String h_cont) {
		this.h_cont = h_cont;
	}

}
