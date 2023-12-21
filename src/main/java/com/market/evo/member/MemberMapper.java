package com.market.evo.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface MemberMapper {

	public abstract int Signup(Member m);
	public abstract List<Member> GetIDForLogin(Member m);
	public abstract int updateMember(Member m);
	public abstract int sellerupdate(Member m);
	public abstract int deleteMember(Member m);
	public boolean selectId(Member m);
	public abstract List<Member> getMemberById(Member m);
	public abstract List<Member> getMemberByAl(Member m);
	public abstract Member searchId(Member m);
	public abstract Member searchPw(Member m);
	
	//고객센터 관련
	public abstract int cont(Helpper h);
	public List<Map<String, Object>> categoryList();
	public List<Map<String, Object>> detailCateList(int categorycode);
	public List<Helpper> helpperList(Helpper h);
	public List<Helpper> helpperListWithPagination(@Param("h") Helpper h,
            @Param("startIndex") int startIndex,
            @Param("itemsPerPage") int itemsPerPage);
	public int getTotalHelpperCount();
}

