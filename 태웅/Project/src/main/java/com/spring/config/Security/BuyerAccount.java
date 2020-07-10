package com.spring.config.Security;

import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.buyer.BuyerVO;



public class BuyerAccount extends User{
	
	public BuyerVO account;
	
	public BuyerAccount(BuyerVO account) {
		super(account.getId(), account.getPassword(), List.of(new SimpleGrantedAuthority("ROLE_"+account.getMemberType())));
		this.account = account;
	}
	
	public BuyerVO getBuyerVO() {
		return account;
	}

}
