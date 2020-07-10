package com.spring.config.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.buyer.BuyerVO;
import com.spring.mapper.BuyerMapper;

@Lazy
@Service()
public class BuyerDetailService implements UserDetailsService {
	
	@Autowired
	private  BuyerMapper mapper;
	
	@Autowired 
	PasswordEncoder passwordEncoder;
//	
	@Override
	public UserDetails loadUserByUsername(String buyerId) throws UsernameNotFoundException {
		
	
		BuyerVO account = mapper.selectOneById(buyerId);
		if (account == null) {
			throw new UsernameNotFoundException(buyerId);
		}
	
		
		return new BuyerAccount(account);
	}
	
	public void RegisterBuyerAccount(BuyerVO buyer) {
		buyer.setPassword(passwordEncoder.encode(buyer.getPassword()));
		 mapper.InsertBuyerAccount(buyer);
		
	}

	public void updateLoginDateBy(String id) {
		mapper.UpdateLoginDateBy(id);

	}
	
}
