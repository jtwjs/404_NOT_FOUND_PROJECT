package com.spring.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired 
	AdminMapper mapper;
	
	@Override
	public boolean duplicateCheck(String id) {

			int count = mapper.selectCountById(id);
			System.out.println("count :" + count);
			
			return count!=0?true:false;
		}
	}

