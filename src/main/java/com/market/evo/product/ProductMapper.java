package com.market.evo.product;

import java.util.List;
import java.util.Map;

public interface ProductMapper {

	public List<Map<String, Object>> categoryList();
	public List<Map<String, Object>> detailCateList();
}
