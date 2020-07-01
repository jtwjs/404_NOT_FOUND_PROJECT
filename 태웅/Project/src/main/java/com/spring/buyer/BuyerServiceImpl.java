package com.spring.buyer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.BuyerMapper;

@Service("buyerService")
public class BuyerServiceImpl implements BuyerService {

		
	@Autowired
	BuyerMapper mapper;
	
	@Override
	public BuyerVO selectOnById(String id) {
		
		BuyerVO buyerAccount = mapper.selectOneById(id);
		return buyerAccount;
	}

	@Override
	public void RegisterBuyerAccount(BuyerVO buyer) {
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

}
