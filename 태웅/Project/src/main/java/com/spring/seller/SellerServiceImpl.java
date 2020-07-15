package com.spring.seller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boardproduct.BoardProductVO;
import com.spring.mapper.BoardProductMapper;
import com.spring.mapper.SellerMapper;

@Service
public class SellerServiceImpl implements SellerService {
	@Autowired
	SellerMapper mapper;
	
	@Autowired
	BoardProductMapper boardMapper;

	
	@Override
	public SellerVO selectOneById(String id) {
		SellerVO sellerAccount = mapper.selectOneById(id);
		return sellerAccount;
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

	@Override
	public ArrayList<BoardProductVO> selectProductListById(String id) {
		ArrayList<BoardProductVO> productList = mapper.selectProductListById(id);
		return productList;
	}

	@Override
	public BoardProductVO BoardSelectOneByBoardId(String board_id) {
		BoardProductVO product = boardMapper.getBoardProductVO(board_id);
		return product;
	}
	
}
