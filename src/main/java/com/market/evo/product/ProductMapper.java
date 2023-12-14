package com.market.evo.product;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface ProductMapper {

	public List<Map<String, Object>> categoryList();
	public List<Map<String, Object>> detailCateList(int categorycode);
	public abstract int addProduct(Product p);
	public List<Map<String, String>> idViewProduct(String p_m_id);
	public abstract List<Product> viewProducts(Product p);
	public  Product getProductByProductNo(BigDecimal p_product_no);
	public List<Product> getUpperWearProducts();
	public abstract int addImage(List<Map<String, String>> imgList);
	public abstract int getProNo(Product p);
	}
