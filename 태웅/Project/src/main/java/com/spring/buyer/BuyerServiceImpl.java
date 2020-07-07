package com.spring.buyer;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.mapper.BuyerMapper;

@Service
public class BuyerServiceImpl implements BuyerService {

		
	@Autowired
	BuyerMapper mapper;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	
	
	@Override
	public BuyerVO selectOnById(String id) {
		
		BuyerVO buyerAccount = mapper.selectOneById(id);
		return buyerAccount;
	}
	
	

	@Override
	public void RegisterBuyerAccount(BuyerVO buyer) {
		buyer.setPassword(passwordEncoder.encode(buyer.getPassword()));
		 mapper.InsertBuyerAccount(buyer);
		
	}

	@Override
	public int UpdateBuyerAccount(BuyerVO buyer) {
		int isUpdate =  mapper.UpdateBuyerAccount(buyer);
		return isUpdate;
	}

	@Override
	public int DeleteBuyerAccount(String id) {
		int isDelete = mapper.DeleteBuyerAccount(id);
		return isDelete;
	}

	@Override
	public boolean duplicateCheck(String id) {
		int count = mapper.selectCountById(id);
		System.out.println("count :" + count);
		
		return count==1?true:false;
	}



	@Override
	public ArrayList<BuyerVO> selectListAll() {
		ArrayList<BuyerVO> list = mapper.selectListAll();
		return list;
	}

}
