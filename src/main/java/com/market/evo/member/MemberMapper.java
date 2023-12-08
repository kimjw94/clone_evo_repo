package com.market.evo.member;

import java.util.List;

public interface MemberMapper {

	public abstract int Signup(Member m);
	public abstract List<Member> GetIDForLogin(Member m);
}
