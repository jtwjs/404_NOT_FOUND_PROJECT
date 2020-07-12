package com.spring.config.Security;


import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.access.vote.AffirmativeBased;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;
import org.springframework.security.web.access.expression.WebExpressionVoter;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Lazy	
	@Autowired CustomDetailService AccountService;
	
	@Autowired public LoginSuccessHandler LoginSuccessHandler;
	
	@Autowired public LoginFailureHandler LoginFailureHandler;
	
	
	public AccessDecisionManager accessDecisionManager() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        roleHierarchy.setHierarchy("ROLE_ADMIN > ROLE_BUYER");
        roleHierarchy.setHierarchy("ROLE_ADMIN > ROLE_SELLER");

        DefaultWebSecurityExpressionHandler handler = new DefaultWebSecurityExpressionHandler();
        handler.setRoleHierarchy(roleHierarchy);

        WebExpressionVoter webExpressionVoter = new WebExpressionVoter();
        webExpressionVoter.setExpressionHandler(handler);

        List<AccessDecisionVoter<? extends Object>> voters = Arrays.asList(webExpressionVoter);

                    return new AffirmativeBased(voters);
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {
        	
  
            http.authorizeRequests()
            		.mvcMatchers("/BordNoticeWrite.sc","//Boardnoticemodify.sc",
            				"/FaqBoardWrite.sc","/FaqBoardModify.sc").hasRole("ADMIN")
            		.mvcMatchers("/Buyer**").hasRole("BUYER")
            		.mvcMatchers("/Seller**").hasRole("SELLER")
            		.mvcMatchers("/**").permitAll()
            		.anyRequest().authenticated()
                    .accessDecisionManager(accessDecisionManager())
                    .and()
                    .formLogin()
                .loginPage("/Login.ad").permitAll()
                .usernameParameter("userId")
                .passwordParameter("userPw")
                .defaultSuccessUrl("/Index.in")
                .successHandler(LoginSuccessHandler)
                .failureHandler(LoginFailureHandler)
                .and().csrf().ignoringAntMatchers("/duplicationCheck**")
                .and()
                .logout()
                .logoutUrl("/logout.ad").permitAll()
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .deleteCookies("JESSIONID","remember-me")
                .and()
                .httpBasic();
            
            http.sessionManagement()
            	.invalidSessionUrl("/Login.ad") // 유효하지않은 세션 redirect
            	.maximumSessions(1)	//동시성제어
            		.expiredUrl("/Login.ad");
            http.rememberMe()
            	.rememberMeParameter("remember")
            	.userDetailsService(AccountService)
            	.key("remember-me");
            	

             
        }
        
        @Override
        public void configure(WebSecurity webSecurity) throws Exception {
         webSecurity.ignoring().antMatchers("/resources/**/**", "/css/**", "/js/**","/Images/**"); 
        }
	
      
        @Override
        protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        	auth.userDetailsService(AccountService);
        }
   
        

	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
	

}