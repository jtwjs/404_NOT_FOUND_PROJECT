package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.buyer.BuyerVO;
import com.spring.buyer.SavePointVO;
import com.spring.buyer.deliveryVO;
@Repository
public interface BuyerMapper {
	public BuyerVO selectOneById(String id);
	public ArrayList<BuyerVO> selectListAll();
	public 	int selectCountById(String id);
	public void InsertBuyerAccount(BuyerVO buyer);
	public int UpdateBuyerAccount(BuyerVO buyer);
	public int DeleteBuyerAccount(String id);
	public void UpdateLoginDateBy(String id);	
	public ArrayList<deliveryVO> deliveryListAll(String id);
	public ArrayList<SavePointVO> savePointListAll(@Param("id")String id,@Param("status")String status,
													@Param("rowStart") int rowStart,@Param("rowEnd") int rowEnd);
	public int savePointCountById(@Param("id")String id, @Param("status")String status);
}
