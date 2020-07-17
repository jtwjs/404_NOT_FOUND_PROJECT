package com.spring.mapper;

import org.springframework.stereotype.Repository;

import com.spring.admin.AccountVO;
import com.spring.admin.AdminVO;


@Repository
public interface AdminMapper {

	AdminVO selectOndById(String id);
	int selectCountById(String id);
	AccountVO selectAccountById(String id);
}
