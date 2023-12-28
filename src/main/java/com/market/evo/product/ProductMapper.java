package com.market.evo.product;

import java.util.List;
import java.util.Map;


public interface ProductMapper {

	public List<Map<String, Object>> categoryList();
	public List<Map<String, Object>> detailCateList(int categorycode);
	public abstract int addProduct(Product p);
	public List<Map<String, String>> idViewProduct(String p_m_id);
	public abstract int addImage(Map<String, Object> imgList);
	public abstract int getProNo(Product p);
	public abstract int addInventory(Map<String, Object> invenList);
	public List<Map<String, Object>> detailProduct(int p_product_no);
	public List<Map<String, Object>> detailInventory(int p_product_no);
	public abstract int updatePro(Product p);
	public abstract int updateThumbImg(Map<String, Object> imgMap);
	public abstract int updateInfoImg(Map<String, Object> imgMap);
	public abstract int updateInven(Map<String, Object> invenList);
	public abstract int deleteInven(Map<String, Object> invenList);
	public abstract int deletePro(Product p);
	public abstract int deleteImg(Map<String, Object> imgMap);
	public List<Map<String, Object>> getProductsWithImagebyCategory(String categoryName);
	public List<Map<String, Object>> getProductswithImagebyDetailCategory(String categoryDetailName);
	public List<Map<String, Object>> getProductDetail(String productNo);
	public List<Map<String, Object>> getProductInventory(String productNo);

}