package com.spring.config.Security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;


@Configuration
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	private static int TIME = 60 * 60; //1시간
	
	@Lazy
	@Autowired
	private BuyerDetailService buyerService;
	
	@Lazy
	@Autowired
	private SellerDetailService sellerService;

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws ServletException, IOException {
		request.getSession().setMaxInactiveInterval(TIME);
		if(authentication.getAuthorities().toString().equals("[ROLE_BUYER]")) {
			buyerService.updateLoginDateBy(((User) authentication.getPrincipal()).getUsername());
			System.out.println("BUYER");
		}
		else if(authentication.getAuthorities().toString().equals("[ROLE_SELLER]")) {
			sellerService.updateLoginDateBy(((User) authentication.getPrincipal()).getUsername());
			System.out.println("SELLER");

		}
		
	
		
        super.onAuthenticationSuccess(request, response, authentication);

	

	}
}

