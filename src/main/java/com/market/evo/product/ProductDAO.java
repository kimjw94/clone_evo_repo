package com.market.evo.product;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.evo.member.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ProductDAO {

	@Autowired
	SqlSession ss;

	// 카테고리
	public void getCategoryName(HttpServletRequest req) {
		try {
			List<Map<String, Object>> category = ss.getMapper(ProductMapper.class).categoryList();

			if (category.size() != 0) {
				req.setAttribute("categoryName", category);
			} else {
				System.out.println("뭐가없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db에 문제있음 ㅠ");
		}
	}

	// 세부카테고리
	public List<Map<String, Object>> getDetailCateName(HttpServletRequest req, int categoryCode) {
		try {

			List<Map<String, Object>> dCategory = ss.getMapper(ProductMapper.class).detailCateList(categoryCode);

			if (dCategory.size() != 0) {
				req.setAttribute("detailCateName", dCategory);

				return dCategory;
			}

			return null;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB에 문제있다!!!");
			return null;
		}
	}

	// 상품추가
	public void addProduct(Product p, HttpServletRequest req) {

		MultipartRequest mr = null;

		// 섬네일 사진 경로
		String path1 = null;
		// 상품 사진 경로
		String path2 = null;

		// 변경된 사진 이름들
		String thumName2 = null;
		String infoName2 = null;

		try {		
			
			path1 = req.getSession().getServletContext().getRealPath("resources/thumbnailImg/");
			path2 = req.getSession().getServletContext().getRealPath("resources/infoImg/");
		

			File folder = new File(path1);
			File folder2 = new File(path2);

			// 폴더 존재 여부
			if (!folder.exists()) {
				try {
					folder.mkdir();

					System.out.println("썸네일사진(thumbnailImg) 폴더가 생성되었습니다.");
				} catch(Exception e) {

					e.printStackTrace();
				}
			} else if (!folder2.exists()) {
				try {
					folder2.mkdir();
					System.out.println("상품정보사진(infoImg) 폴더가 생성되었습니다.");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			// 처음엔 path1(썸네일경로)에 다 저장
			mr = new MultipartRequest(req, path1, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

			try {

				// 파일명에 시간추가하기
				String thumName = mr.getFilesystemName("im_thumbnail_image");
				String infoName = mr.getFilesystemName("im_info_image");

				// 지금 시간 조회
				String now = new SimpleDateFormat("yyMMddHmsS").format(new Date());

				// 썸네일이미지 파일
				thumName2 = now + thumName;
				infoName2 = null;

				File oldPhoto = new File(path1 + thumName);
				File newPhoto = new File(path1 + thumName2);
				oldPhoto.renameTo(newPhoto);

				if (infoName != null) {
					infoName2 = now + infoName;

					// 정보 이미지 파일
					oldPhoto = new File(path1 + infoName);
					newPhoto = new File(path2 + infoName2);
					oldPhoto.renameTo(newPhoto);
				}

				Member m = (Member) req.getSession().getAttribute("loginMember");

				p.setP_m_id(m.getM_id());
				p.setP_product_name(mr.getParameter("p_product_name"));
				p.setP_info(mr.getParameter("p_info"));

				int p_category_code = Integer.parseInt(mr.getParameter("p_category_code"));
				p.setP_category_code(p_category_code);

				int p_price = Integer.parseInt(mr.getParameter("p_price"));
				p.setP_price(p_price);

				// 상품테이블에 추가
				if (ss.getMapper(ProductMapper.class).addProduct(p) == 1) {
					System.out.println("상품 추가가 완료되었습니다.");
				}

				// 상품번호 조회해오기
				int pro_no = ss.getMapper(ProductMapper.class).getProNo(p);

				// 이미지 따로 추가
				Map<String, Object> imgMap = new HashMap<String, Object>();

				String thImg = URLEncoder.encode(thumName2, "UTF-8").replace("+", " ");
				String infoImg = null;
				if (infoName2 != null) {
					infoImg = URLEncoder.encode(infoName2, "UTF-8").replace("+", " ");
					imgMap.put("im_info_image", infoImg);
				}

				imgMap.put("im_p_product_no", pro_no);
				imgMap.put("im_thumbnail_image", thImg);

				// 이미지 추가
				if (ss.getMapper(ProductMapper.class).addImage(imgMap) == 1) {
					System.out.println("이미지 추가가 완료되었습니다.");
				}

				Map<String, Object> inventory = new HashMap<String, Object>();
				Map<String, Object> insertInven = new HashMap<String, Object>();

				// i_product로만 시작되는 inputName 불러오기
				Enumeration<String> enumKey = mr.getParameterNames();
				while (enumKey.hasMoreElements()) {
					String key = enumKey.nextElement();
					if (key.contains("i_product")) {
						inventory.put(key, mr.getParameter(key));
					}
				}

				// i_product ~ 에서 뒤에 붙은 숫자 제거하고 insert
				for (int i = 1; i <= inventory.size() / 3; i++) {
					String num = String.valueOf(i);
					for (Map.Entry<String, Object> entry : inventory.entrySet()) {
						if (entry.getKey().contains(num)) {
							String getKey = entry.getKey();
							String result = getKey.substring(0, getKey.length() - 1);
							insertInven.put(result, entry.getValue());
						}
						;
					}
					insertInven.put("i_p_product_no", pro_no);
					System.out.println(insertInven + " " + i);
					try {
						if (ss.getMapper(ProductMapper.class).addInventory(insertInven) == 1) {
							System.out.println("재고 추가" + i);
						}

					} catch (Exception e) {
						e.printStackTrace();
						delImg(path1, path2, thumName2, infoName2);
						System.out.println("재고 추가할때 에러가..!");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				delImg(path1, path2, thumName2, infoName2);
				System.out.println("DB 에러! 이미지 파일 삭제했습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("사진 용량이 너무 커요");
			return;
		}
	}

	
	public void updateProduct(Product p, HttpServletRequest req) {
		
		MultipartRequest mr = null;
		
		// 섬네일 사진 경로
		String path1 = null;
		// 상품 사진 경로
		String path2 = null;
		
		// 변경된 사진 이름들
		String thumName2 = null;
		String infoName2 = null;
		
		try { 
			path1 = req.getSession().getServletContext().getRealPath("resources/thumbnailImg/");
			path2 = req.getSession().getServletContext().getRealPath("resources/infoImg/");
			
			File folder = new File(path1);
			File folder2 = new File(path2);
			
			// 폴더 존재 확인 다시 한번
			if(!folder.exists()) {
				System.out.println("썸네일이미지폴더가 없습니다.");
				return;
			} else if(!folder2.exists()) {
				System.out.println("상품정보 이미지 폴더가 없어요");
			}
			
			
			mr = new MultipartRequest(req, path1, 30 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		
			// 파일명에 시간추가하기
			String thumName = mr.getFilesystemName("im_thumbnail_image");
			String infoName = mr.getFilesystemName("im_info_image");
			
			// 지금 시간 조회
			String now = new SimpleDateFormat("yyMMddHmsS").format(new Date());
			
			// 썸네일이미지 파일
			thumName2 = now + thumName;
			infoName2 = null;

			File oldPhoto = new File(path1 + thumName);
			File newPhoto = new File(path1 + thumName2);
			oldPhoto.renameTo(newPhoto);
			
			if(infoName != null) {
				infoName2 = now + infoName;

				//정보 이미지 파일
				oldPhoto = new File(path1 + infoName);
				newPhoto = new File(path2 + infoName2);
				oldPhoto.renameTo(newPhoto);
			}	
		
		
		
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("사진 용량이 너무 큽니다");
			return;
		}
	}
	
	// 이미지 삭제 함수

	public void delImg(String path1, String path2, String thumbImg, String infoImg) {
		File f = new File(path1 + thumbImg);
		File f2 = new File(path2 + infoImg);

		f.delete();
		if (f2.exists()) {
			f2.delete();
		}
		System.out.println("이미지 삭제 완료");
	}

	// 판매자가 추가한 상품만 모아보기
	public void idViewProduct(HttpServletRequest req) {
		try {

			Member m = (Member) req.getSession().getAttribute("loginMember");
			String p_m_id = m.getM_id();

			List<Map<String, String>> pl = ss.getMapper(ProductMapper.class).idViewProduct(p_m_id);

			if (pl.size() != 0) {

				req.setAttribute("idProduct", pl);
				req.setAttribute("p", "");

			} else {
				System.out.println("등록한 상품이 없어요");
				req.setAttribute("p", "등록한 상품이 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	
	
	// 상품 디테일
	public void detailProduct(HttpServletRequest req, int p_product_no) {
		try {
			System.out.println("상품번호 : " + p_product_no);
			List<Map<String, Object>> dp = ss.getMapper(ProductMapper.class).detailProduct(p_product_no);
			System.out.println("상품내용 : " + dp + " ");
			
			List<Map<String, Object>> di = ss.getMapper(ProductMapper.class).detailInventory(p_product_no);
			System.out.println("재고 현황 : " + di + " ");
			
			
			if(dp.size() != 0) {
				req.setAttribute("detailProduct", dp);
			}
			
			if(di.size() != 0) {
				req.setAttribute("detailInventory", di);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getProductsWithImagebyCategory(HttpServletRequest req,String categoryName) {
		

		try {
			List<Map<String, Object>> ProductsCategory = ss.getMapper(ProductMapper.class)
					.getProductsWithImagebyCategory(categoryName);
			if (ProductsCategory.size() != 0) {
				req.setAttribute("ProductsCategory", ProductsCategory);
			} else {
				System.out.println("해당 카테고리에 제품 없음");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db에 문제있음 ㅠ");
		}

	}

	public void getProductswithImagebyDetailCategory(HttpServletRequest req, String categoryDetailName) {

		try {
			List<Map<String, Object>> ProductDetailCategory = ss.getMapper(ProductMapper.class)
					.getProductswithImagebyDetailCategory(categoryDetailName);
			if (ProductDetailCategory.size() != 0) {
				req.setAttribute("ProductsDetailCategory", ProductDetailCategory);
			} else {
				System.out.println("해당 카테고리에 제품 없음");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db에 문제있음 ㅠ");
		}
	}

	public void getProductDetail(HttpServletRequest req, String productNo) {

		try {
			List<Map<String, Object>> ProductDetail = ss.getMapper(ProductMapper.class).getProductDetail(productNo);
			List<Map<String, Object>> ProductInventory = ss.getMapper(ProductMapper.class)
					.getProductInventory(productNo);

			if (ProductDetail.size() != 0) {
				req.setAttribute("Detail", ProductDetail);
				System.out.println(ProductDetail);
			} else {
				System.out.println("해당 번호 제품 없음");
			}

			if (ProductInventory.size() != 0) {
				List<String> colorList = new ArrayList<String>();
				List<String> sizeList = new ArrayList<String>();

				for (Map<String, Object> inventoryItem : ProductInventory) {
					String color = (String) inventoryItem.get("I_PRODUCT_COLOR");
					String size = (String) inventoryItem.get("I_PRODUCT_SIZE");

					// 중복 체크 후 추가
					if (!colorList.contains(color)) {
						colorList.add(color);
					}

					if (!sizeList.contains(size)) {
						sizeList.add(size);
					}
				}

				req.setAttribute("Inventory", ProductInventory);
				req.setAttribute("ColorList", colorList);
				req.setAttribute("SizeList", sizeList);

				System.out.println(ProductInventory);
				System.out.println(colorList);
				System.out.println(sizeList);
			} else {
				System.out.println("해당 번호 재고 없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("db에 문제있음 ㅠ");
		}

	}

}
