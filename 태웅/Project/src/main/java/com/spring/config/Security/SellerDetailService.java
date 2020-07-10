package com.spring.config.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.mapper.SellerMapper;
import com.spring.seller.SellerVO;

@Lazy
@Service()
public class SellerDetailService implements UserDetailsService{
	
	@Autowired
	private SellerMapper mapper;
	
	@Autowired 
	PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String sellerId) throws UsernameNotFoundException {
		
		/*�����ϴ� �κ�*/
		SellerVO account = mapper.selectOneById(sellerId);
		if (account == null) {
			throw new UsernameNotFoundException(sellerId);
		}
		System.out.println("���̵�"+account.getId()+"���"+account.getPassword()+"����"+account.getMemberType());
		
		return new SellerAccount(account);
	}
	
	public void RegisterSellerAccout(SellerVO seller) {
		seller.setPassword(passwordEncoder.encode(seller.getPassword()));
		 mapper.InsertSellerAccout(seller);
		
		
	}

	public void updateLoginDateBy(String id) {
		mapper.UpdateLoginDateBy(id);
		System.out.println("Test2:����Ϸ�");
	}
	
}
