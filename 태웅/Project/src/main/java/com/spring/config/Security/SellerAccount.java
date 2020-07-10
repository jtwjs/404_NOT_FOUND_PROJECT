package com.spring.config.Security;

import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.seller.SellerVO;

@SuppressWarnings("serial")
public class SellerAccount extends User{
	
	public SellerVO account;
	
	public SellerAccount(SellerVO account) {
		super(account.getId(), account.getPassword(), List.of(new SimpleGrantedAuthority("ROLE_"+account.getMemberType())));
		this.account = account;
	}

	public SellerVO getSellerVO() {
		return account;
	}
}
