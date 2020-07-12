package com.spring.mapper;

import org.springframework.stereotype.Repository;

import com.spring.admin.AdminVO;


@Repository
public interface AdminMapper {

	AdminVO selectOndById(String id);
}
