package com.market.evo.member;

import java.util.List;

public interface MemberMapper {

	public abstract int Signup(Member m);
	public abstract List<Member> GetIDForLogin(Member m);
	public abstract int updateMember(Member m);
	public abstract int sellerupdate(Member m);
	public abstract int deleteMember(Member m);
	public boolean selectId(Member m);
	public abstract List<Member> getMemberById(Member m);
	public abstract List<Member> getMemberByAl(Member m);
}
