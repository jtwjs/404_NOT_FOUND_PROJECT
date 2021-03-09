package com.spring.config.Security;

import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.admin.AccountVO;

public class UserAccount extends User {
	public AccountVO account;
	
	public UserAccount(AccountVO account) {
		super(account.getId(), account.getPassword(), List.of(new SimpleGrantedAuthority("ROLE_"+account.getMemberType())));
		this.account = account;
	}
	
	public AccountVO getAdminVO() {
		return account;
	}

}
