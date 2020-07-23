package com.spring.order;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
public class KakaoPay {
	private static final String HOST = "https://kapi.kakao.com";
	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	
	public String kakaoPayReady(String order_id, String buyer_id,String item_name,String quantity
			,String total_amount ) {
		RestTemplate restTemplate = new RestTemplate();
		
		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization","KaKaoAK" + "391192");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE+";charset=UTF-8");
		
		//서버로 요청할 Body
		MultiValueMap<String, String>params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME"); //가맹점코드
		params.add("partner_order_id", order_id); //가맹점 주문번호
		params.add("partner_user_id", buyer_id); // 가맹점 회원 id
		params.add("item_name", item_name);		//상품명
		params.add("quantity", quantity);		//상품수량
		params.add("total_amount", total_amount);	//상품총액
		params.add("tax_free_amount", "100"); //상품 비과세 금액
		params.add("approval_url", "http://localhost:8080/project/OrderComplete.or"); //결제 성공시 redirect url
		params.add("cancle_url", "http://localhost:8080/project/");	// 결제 취소시 redirect url
		params.add("fail_url", "http://localhost:8080/project/");		//결제 실패시 redirect url
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST+ "/v1/payment/ready"), body,KakaoPayReadyVO.class);
			return kakaoPayReadyVO.getNext_redirect_pc_url();
		} catch(RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
	 return "/pay";	
	}
	
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token,String order_id, String buyer_id,String total_amount ) {
		RestTemplate restTemplate = new RestTemplate();
		
		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization","KaKaoAK" + "391192");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE+";charset=UTF-8");
		//서버로 요청할 Body
		MultiValueMap<String,String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid",kakaoPayReadyVO.getTid());
		params.add("partner_order_id", order_id);
		params.add("partner_user_id", buyer_id);
		params.add("pg_token", pg_token);
		params.add("total_amount", total_amount);
		HttpEntity<MultiValueMap<String,String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);

			return kakaoPayApprovalVO;
		} catch (RestClientException e) {
			e.printStackTrace();
		} catch(URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}
}
