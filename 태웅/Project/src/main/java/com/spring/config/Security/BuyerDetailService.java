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
		
		/*인증하는 부분*/
		BuyerVO account = mapper.selectOneById(buyerId);
		if (account == null) {
			throw new UsernameNotFoundException(buyerId);
		}
		System.out.println("아이디"+account.getId()+"비번"+account.getPassword()+"권한"+account.getMemberType());
		
		return new BuyerAccount(account);
	}
	
	public void RegisterBuyerAccount(BuyerVO buyer) {
		buyer.setPassword(passwordEncoder.encode(buyer.getPassword()));
		 mapper.InsertBuyerAccount(buyer);
		
	}

	public void updateLoginDateBy(String id) {
		mapper.UpdateLoginDateBy(id);
		System.out.println("Test2:실행완료");
	}
	
}
