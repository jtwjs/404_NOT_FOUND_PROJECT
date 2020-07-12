package com.spring.seller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.SellerMapper;

@Service
public class SellerServiceImpl implements SellerService {
	@Autowired
	SellerMapper mapper;
	

	
	@Override
	public SellerVO selectOneById(String id) {
		SellerVO sellerAccount = mapper.selectOneById(id);
		return sellerAccount;
	}

	@Override
	public boolean duplicateCheck(String id) {
		int count = mapper.selectCountById(id);
		System.out.println("시발왜안되냐고~"+count);
		return count==1?true:false;
	}

	@Override
	public void RegisterSellerAccout(SellerVO seller) {
		mapper.InsertSellerAccout(seller);
	}

	@Override
	public int UpdateSellerAccount(SellerVO seller) {
		int isUpdate = mapper.UpdateSellerAccount(seller);
		return isUpdate;
	}

	@Override
	public int DeleteSellerAccount(String id) {
		int isDelete = mapper.DeleteSellerAccount(id);
		return isDelete;
	}

	@Override
	public void UpdateProfileImg(SellerVO account) {
		mapper.UpdateProfileImg(account);
		
	}
	
}
