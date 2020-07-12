package com.spring.config.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
		
		AdminVO adminAccount = adminMapper.selectOndById(userId);
		BuyerVO buyerAccount = buyerMapper.selectOneById(userId);
		SellerVO sellerAccount = sellerMapper.selectOneById(userId);
		
		if (buyerAccount == null && sellerAccount == null && adminAccount == null) {
			throw new UsernameNotFoundException(userId);
		} else if (adminAccount != null && buyerAccount == null && sellerAccount == null ) {
			System.out.println("아이디"+adminAccount.getId()+"비번"+adminAccount.getPassword()+"권한"+adminAccount.getMemberType());
			return new AdminAccount(adminAccount);
		}
		else if (buyerAccount != null && sellerAccount == null && adminAccount == null) {
			System.out.println("아이디"+buyerAccount.getId()+"비번"+buyerAccount.getPassword()+"권한"+buyerAccount.getMemberType());
			return new BuyerAccount(buyerAccount);
		} else {
			System.out.println("아이디"+sellerAccount.getId()+"비번"+sellerAccount.getPassword()+"권한"+sellerAccount.getMemberType());
			return new SellerAccount(sellerAccount);
		}
	
		
		
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

	
}
