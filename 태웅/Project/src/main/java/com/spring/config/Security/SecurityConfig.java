package com.spring.config.Security;


import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDecisionVoter;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.access.vote.AffirmativeBased;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;
import org.springframework.security.web.access.expression.WebExpressionVoter;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
		
	@Autowired
	CustomUserDetailsService accountService;
	
	public AccessDecisionManager accessDecisionManager() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        roleHierarchy.setHierarchy("ROLE_ADMIN > ROLE_BUYER");

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
            		
            		.mvcMatchers("/BuyerMyPage.by").hasRole("BUYER")
            		.mvcMatchers("/**").permitAll()
            		.anyRequest().authenticated()
                    .accessDecisionManager(accessDecisionManager())
                    ;
                http.formLogin()
                .loginPage("/LoginBuyer.ad").permitAll()
                .usernameParameter("userId")
                .passwordParameter("userPw")
                .defaultSuccessUrl("/Index.in")
                .and().csrf().disable();
                
                http.logout()
                .logoutUrl("/logout.ad")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .deleteCookies("JESSIONID");
                
                http.httpBasic();
             
        }
        
        @Override
        public void configure(WebSecurity webSecurity) throws Exception {
         webSecurity.ignoring().antMatchers("/resources/**", "/css/**", "/js/**","/Images/**"); 
        }
	
        
        
        /*@Override 안해도 빈으로 등록만되있으면 알아서 갖다씀*/
        @Override
        protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        	auth.userDetailsService(accountService);
        }
   
        
        
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
}