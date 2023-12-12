package com.market.evo.product;

import java.util.List;
import java.util.Map;


public interface ProductMapper {

	public List<Map<String, Object>> categoryList();
	public List<Map<String, Object>> detailCateList(int categorycode);
	public abstract int addProduct(Product p);
	public List<Map<String, String>> idViewProduct(String p_m_id);
	public abstract List<Product> viewProducts(Product p);
}
