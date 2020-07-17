package com.spring.config.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.admin.AccountVO;
import com.spring.admin.AdminVO;
import com.spring.buyer.BuyerVO;
import com.spring.mapper.AdminMapper;
import com.spring.mapper.BuyerMapper;
import com.spring.mapper.SellerMapper;
import com.spring.seller.SellerVO;

@Lazy
@Service()
public class CustomDetailService implements UserDetailsService {
	
	@Autowired private  AdminMapper adminMapper;
	@Autowired private  BuyerMapper buyerMapper;
	@Autowired private  SellerMapper sellerMapper;
	
	@Autowired 
	PasswordEncoder passwordEncoder;
//	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		
		AccountVO userAccount = adminMapper.selectAccountById(userId);
		
		if (userAccount == null) {
			throw new UsernameNotFoundException(userId);
		} 
		System.out.println("아이디"+userAccount.getId()+"비번"+userAccount.getPassword()+"권한"+userAccount.getMemberType());
		return new UserAccount(userAccount);
		
	}
	
	public void RegisterBuyerAccount(BuyerVO buyer) {
		buyer.setPassword(passwordEncoder.encode(buyer.getPassword()));
		buyerMapper.InsertBuyerAccount(buyer);
		
	}

	public void RegisterSellerAccout(SellerVO seller) {
		seller.setPassword(passwordEncoder.encode(seller.getPassword()));
		 sellerMapper.InsertSellerAccout(seller);
	}
	
	public void updateBuyerLoginDateBy(String id) {
		buyerMapper.UpdateLoginDateBy(id);
	}
	

	public void updateSellerLoginDateBy(String id) {
		sellerMapper.UpdateLoginDateBy(id);
	}
	
	public int BuyerConfirmPassword(BuyerVO buyer) {
		buyer.setPassword(passwordEncoder.encode(buyer.getPassword()));
		return buyerMapper.UpdateBuyerPassword(buyer);
	}
	
	public int SellerConfirmPassword(SellerVO seller) {
		seller.setPassword(passwordEncoder.encode(seller.getPassword()));
		return sellerMapper.UpdateSellerPassword(seller);
	}

	
}
