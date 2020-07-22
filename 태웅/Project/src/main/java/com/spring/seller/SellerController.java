package com.spring.seller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.admin.AccountVO;
import com.spring.boardproduct.BoardProductVO;
import com.spring.config.Security.CurrentUser;
import com.spring.config.Security.CustomDetailService;
import com.spring.order.OrderRecordVO;

@Controller
public class SellerController {
	
	@Autowired
	SellerServiceImpl Sellerservice;
	
	@Autowired
	CustomDetailService SecurityService;
	
	@RequestMapping(value = "/SellerMyPage.se")  
	public String sellerMyPage(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
    	model.addAttribute("user",sellerAccount);
    	
    	
		return "Seller/mypage_main";
	}
	
	
	
	@RequestMapping(value = "/SellerProductRegister.se")  // �긽�뭹�궡�뿭 - �긽�뭹�벑濡�
	public String sellerProductRegister(Model model, @CurrentUser AccountVO account) {
		
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user",sellerAccount);
		
		
		return "Seller/mypage_productRegister";
	}
	
	@RequestMapping(value = "/SellerProductList.se")    // �긽�뭹�궡�뿭 - �긽�뭹�궡�뿭
	public String sellerProductList(Model model, @CurrentUser AccountVO account, BoardProductVO board) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		board.setSeller_id(account.getId());
		ArrayList<BoardProductVO> productList = Sellerservice.selectProductListById(board.getSeller_id());

		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("productList", productList);
		model.addAttribute("user",sellerAccount);
		
		return "Seller/mypage_productList";
	}
	
	@RequestMapping(value = "/SellerProductModifyForm.se")    // �긽�뭹�궡�뿭 - �뙋留ㅺ� �닔�젙
	public String sellerProductModifyForm(Model model, @CurrentUser AccountVO account,
			@RequestParam(value = "board_id", required= true) String board_id) {
		
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		BoardProductVO product = Sellerservice.BoardSelectOneByBoardId(board_id);
		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("product", product);
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_productModify";
	}
	
	@RequestMapping(value = "/SellerProductModify.se")
	public String sellerProductModify() {
		return "redirect:/Seller/mypage_productList";
	}
	
	@RequestMapping(value = "/SellerOrderStatus.se")    // 嫄곕옒�궡�뿭 - 二쇰Ц愿�由�
	public String sellerOrderStatus(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_orderStatus";
	}
	

	
	@RequestMapping(value = "/SellerCalculateManager.se")    // 嫄곕옒�궡�뿭 - 嫄곕옒紐⑸줉
	public String sellerCalculateManager(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_calculateManager";
	}
	
	@RequestMapping(value = "/SellerMarketPriceInfo.se")  // �긽�뭹 �떆�꽭�젙蹂�
	public String sellerMarketPriceInfo(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_marketPriceInfo";
	}
	
	// �상품시세정보조히
	
	@RequestMapping(value = "/SellerMarketPriceInfoSearch.se", method = RequestMethod.GET)
	public String sellerMarketPriceInfoSearch(Model model, String regday, String countycode, String itemcategorycode) {
		
		String url = "https://www.kamis.or.kr/customer/price/wholesale/catalogue.do?action=daily&regday=" 
		    + regday + "&countycode=" + countycode + "&itemcategorycode=" + itemcategorycode + "&convert_kg_yn=N";
		
		// 건들지말것
		// =================================================================================
		// �크롤링할 해당 사이트의 인증시 유효성 체크 비활성화
		
		TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {

			@Override
			public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
				// TODO Auto-generated method stub
				
			}

			@Override
			public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
				// TODO Auto-generated method stub
				
			}

			@Override
			public X509Certificate[] getAcceptedIssuers() {
				// TODO Auto-generated method stub
				return null;
			}
			
		}
				
		};
		
		// Install the all-trusting trust manager
		SSLContext sc = null;
		
		try {
			sc = SSLContext.getInstance("SSL");
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			sc.init(null, trustAllCerts, new java.security.SecureRandom());
		} catch (KeyManagementException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
		// Create all-trusting host name verifier
		HostnameVerifier allHostsValid = new HostnameVerifier() {

			@Override
			public boolean verify(String hostname, SSLSession session) {
				// TODO Auto-generated method stub
				return true;
			}
			
		};
		
		// Install the all-trusting host verifier
		HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
		
		// ===========================================================================
		
		
		
		Document doc = null;
		
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
       
        
		Elements element = doc.select("div.content");
		
		
       String table = element.select("section > table > tbody").html();
		
       model.addAttribute("table", table);
		
		return "Seller/mypage_marketPriceInfo";
	}
	
	
	@RequestMapping(value = "/SellerProductQNA.se")  // Q&A - �긽�뭹臾몄쓽
	public String sellerProductQNA(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_productQNA";
	}
	
	@RequestMapping(value = "/SellerProductReview.se")  // Q&A - �긽�뭹�썑湲�
	public String sellerProductReview(Model model, @CurrentUser AccountVO account) {
		SellerVO sellerAccount =  Sellerservice.selectOneById(account.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user",sellerAccount);
		return "Seller/mypage_productReview";
	}
	
   @RequestMapping(value = "JoinSeller.se" ,method = RequestMethod.POST)
    public String RegisterSellerAccount(@ModelAttribute("seller") SellerVO seller) {
    		String telCarrierNum = seller.getTelCarrierNum();
    		String telAllocationNum = seller.getTelAllocationNum();
    		String telDiscretionaryNum = seller.getTelDiscretionaryNum();
    		String emailId = seller.getEmailId();
    		String emailAddr = seller.getEmailAddr();
    		String addrNum = seller.getAddrNum();
    		String addrRoadName = seller.getAddrRoadName();
    		String addrDetail = seller.getAddrDetail();
 
    		
    		seller.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
    		seller.setEmail(emailId, emailAddr);
    		seller.setAddress(addrNum, addrRoadName, addrDetail);
    		SecurityService.RegisterSellerAccout(seller);
    		
    		return "redirect:/JoinSellerComplete.ad";
    	
    }
   

   @RequestMapping(value ="/profileThumbnail.se", method = RequestMethod.POST,
		   produces="text/plain;charset=utf-8")
   @ResponseBody
   public String profileThumbnail(Model model, MultipartRequest multipartRequest) {
	   MultipartFile file = multipartRequest.getFile("imgFile");
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String uploadFolder_profile_img = "C:\\Project156\\upload/profile_img";
		String img = imgSave(file, uploadFolder_profile_img);
		System.out.println("img"+img);
		StringBuilder img_path = new StringBuilder(
				"/img/profile_img/"+str.replace("-", "/")+"/");
		String path = img_path.toString();
		return path+"@"+img;
   }
 
   

	@RequestMapping(value = "/UpdateSellerAccountForm.se")  // 프로필 수정
	public String UpdateSellerAccountForm(Model model, @CurrentUser AccountVO seller) {
		
		SellerVO sellerAccount = Sellerservice.selectOneById(seller.getId());
		int mailIndex = sellerAccount.getEmail().indexOf("@");
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		sellerAccount.setEmailId(sellerAccount.getEmail().substring(0,mailIndex));
		sellerAccount.setEmailAddr(sellerAccount.getEmail().substring(mailIndex+1));
		sellerAccount.setTelCarrierNum(sellerAccount.getTel().substring(0,3));
		sellerAccount.setTelAllocationNum(sellerAccount.getTel().substring(3,7));
		sellerAccount.setTelDiscretionaryNum(sellerAccount.getTel().substring(7,11));
	 	try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	 	
	 	model.addAttribute("user",sellerAccount);
	 	
   		return "Seller/mypage_infoModify";
	}
	
	
	
	@RequestMapping(value = "/UpdateSellerAccount.se")
   public String UpdateSellerAccount(String id, String emailId,String name, String emailAddr, String telCarrierNum,
		   String telAllocationNum, String telDiscretionaryNum, String bankName, String bankAccountNum,
		   @RequestPart(value="profileImg", required = false)MultipartFile profile_img)throws IOException{
		SellerVO seller = new SellerVO();
		seller.setId(id);
		seller.setTel(telCarrierNum, telAllocationNum, telDiscretionaryNum);
		seller.setEmail(emailId, emailAddr);
		seller.setBankAccountNum(bankAccountNum);
		seller.setBankName(bankName);
		seller.setName(name);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String uploadFolder_profile_img = "C:\\Project156\\upload/profile_img"; //프로필 이미지 업로드 경로
		if(!profile_img.isEmpty()) {
			seller.setProfileImg(imgSave(profile_img, uploadFolder_profile_img));
			
			StringBuilder img_path = new StringBuilder(
					"/img/profile_img/"+str.replace("-", "/")+"/");
			seller.setProfileImgPath(img_path.toString());
			
			
			}else {
				seller.setProfileImg("no_profile.png");
				seller.setProfileImgPath("/img/common/");
			}


		Sellerservice.UpdateSellerAccount(seller);
   	
   	return "redirect:/SellerMyPage.se";
   	    	
   }
	
	@RequestMapping(value = "/UpdateSellerPasswordFrom.se")
   public String UpdateSellerPasswordFrom(Model model, @CurrentUser AccountVO seller) {
		
		SellerVO sellerAccount = Sellerservice.selectOneById(seller.getId());
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		
   
	   	System.out.println("11seller.getId() : " + sellerAccount.getId());
	   	System.out.println("11seller.getPassword() : " + sellerAccount.getPassword());
	   	
	   	try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	   	model.addAttribute("user",sellerAccount);
   	
	   	return "Seller/mypage_passwordModify";
   }
	private String imgSave(MultipartFile imgFile, String uploadFolder) {
		// 저장할 이미지 파일, 저장할 폴더경로
		// 반드시 원본파일을 만들고 난 뒤 사용해야 함
		
		File uploadPath = getFolder(uploadFolder); // 오늘 날짜로 경로폴더 만들기
		UUID uuid = UUID.randomUUID();  // 파일이름 중복방지를 위하여 랜덤으로 임의의 값 생성
		StringBuilder file_name = 
				new StringBuilder(uuid.toString() + "_" + imgFile.getOriginalFilename()); // 파일 이름 만들기
		File createFile = new File(uploadPath, file_name.toString()); // 저장파일 생성
		
		try {
			
			if(checkImageType(createFile)) {  // 업로드된 파일이 이미지파일인지 체크
				imgFile.transferTo(createFile);  // 파일 저장
			}
			
		}catch(Exception e) {
			
		}
		
		return file_name.toString();
	}
	
	private File getFolder(String uploadFolder) {  // 현재 날짜로 폴더경로 생성
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		File uploadPath = new File(uploadFolder, str.replace("-", File.separator));
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		return uploadPath;
	}
	
private boolean checkImageType(File file) {  // 파일 이미지 체크
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
		return false;
	}
	
	
   
   @RequestMapping(value = "/UpdateSellerPassword.se")
   public String UpdateSellerPassword(SellerVO seller) {
		
		System.out.println("22seller.getId() : " + seller.getId());
   	System.out.println("22seller.getPassword() : " + seller.getPassword());
		
		SecurityService.SellerConfirmPassword(seller);
 		
		return "redirect:/SellerMyPage.se";
   }    
   
   @RequestMapping(value = "/SellerTransactionList.se")    // 거래내역 - 거래목록
	public String sellerTransactionList(Model model, @CurrentUser AccountVO account,
										OrderRecordVO orderRecordVo,
		@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		System.out.println("test");
		System.out.println("listCount : " + Sellerservice.getOrderRecordOneByIdListCount(account.getId()));
		String id = account.getId();
		SellerVO sellerAccount = Sellerservice.selectOneById(id);

	
		int limit = 10;
		int listcount = Sellerservice.getOrderRecordOneByIdListCount(account.getId());		
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;

		List<OrderRecordVO> orderRecordList = Sellerservice.getOrderRecordOneByIdList(account.getId(), startrow, endrow);
		
		//총 페이지 수
  		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
  		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
  		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
  		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
  		int endpage = maxpage;
  		
  		if (endpage>startpage+10-1) endpage=startpage+10-1;
  		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("orderRecordList", orderRecordList);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		
		
		model.addAttribute("orderRecordlist", orderRecordList);		
		System.out.println("orderRecordlist222 : " + orderRecordList);
				
		//주문번호
		model.addAttribute("order_id", orderRecordVo.getOrder_id());
		//상품명
		model.addAttribute("board_title", orderRecordVo.getBoard_title());
		
		//가격
		model.addAttribute("amount", orderRecordVo.getAmount());
		model.addAttribute("price", orderRecordVo.getPrice());
	
		//구매일
		model.addAttribute("order_date", orderRecordVo.getOrder_date());
			
		//회원 구분
		model.addAttribute("non_member_flag", orderRecordVo.getNon_member_flag());
		
		//사이드메뉴 프로필 정보
		sellerAccount.setLoginDate(sellerAccount.getLoginDate().substring(0,10));
		try {
			if(sellerAccount.getProfileImg() == null&&sellerAccount.getProfileImgPath() ==null) {
				sellerAccount.setProfileImg(URLEncoder.encode("no_profile.png","UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode("/img/common/", "UTF-8"));
			}else {
				sellerAccount.setProfileImg(URLEncoder.encode(sellerAccount.getProfileImg(),"UTF-8"));
				sellerAccount.setProfileImgPath(URLEncoder.encode(sellerAccount.getProfileImgPath(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
    	model.addAttribute("user",sellerAccount);
		
		return "Seller/mypage_transactionList";
	}
 
	
}
