package com.spring.config.Security;

import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.admin.AdminVO;

public class AdminAccount extends User{

	public AdminVO account;
	
	public AdminAccount(AdminVO account) {
		super(account.getId(), account.getPassword(), List.of(new SimpleGrantedAuthority("ROLE_"+account.getMemberType())));
		this.account = account;
	}
	
	public AdminVO getAdminVO() {
		return account;
	}
	
	
}
