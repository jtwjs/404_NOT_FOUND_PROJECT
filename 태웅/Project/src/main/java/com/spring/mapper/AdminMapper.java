package com.spring.mapper;

import org.springframework.stereotype.Repository;

import com.spring.admin.AccountVO;
import com.spring.admin.AdminVO;


@Repository
public interface AdminMapper {

	public AdminVO selectOneById(String id);
	public int selectCountById(String id);
	public AccountVO selectAccountById(String id);
	public int getAllAccountCount();
}
