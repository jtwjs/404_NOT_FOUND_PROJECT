package com.spring.boardproduct;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.spring.buyer.BuyerVO;
import com.spring.config.Security.CurrentUser;
import com.spring.seller.SellerVO;

@Controller
public class BoardProductController {
	
	@Autowired
	private BoardProductService boardProductService;

    @GetMapping(value = "/BoardProductList.bo") // 판매글 리스트
	public String boardProductList(Model model,
			@RequestParam(value="category_1", required = false, defaultValue="0")int category_1, 
			@RequestParam(value="category_2", required = false, defaultValue="0")int category_2, 
			@RequestParam(value="category_local", required = false, defaultValue="0")int category_local,
		    @RequestParam(value="sort_list", required = false, defaultValue="2")int sort_list, 
		    @RequestParam(value="page_num", required = false, defaultValue="1")int page_num, 
		    @RequestParam(value="page_amount", required = false, defaultValue="5")int page_amount) {
		
        ArrayList<BoardProductVO> vo_list = null;
        String category_title = null;
        ArrayList<String> category_sub = new ArrayList<String>();
        int vo_list_size = 0;
        
        if(category_1 != 0) {
            vo_list = boardProductService.getBoardList_category1(category_1, sort_list, page_num, page_amount);	
            vo_list_size = boardProductService.getBoardListSize_1(category_1);
    	}
    	
    	if(category_2 != 0) {
    		vo_list = boardProductService.getBoardList_category2(category_2, sort_list, page_num, page_amount);
    		vo_list_size = boardProductService.getBoardListSize_2(category_2);
    	}
    	
    	if(category_local != 0) {
    		vo_list = boardProductService.getBoardList_categoryLocal(category_local, sort_list, page_num, page_amount);
    		vo_list_size = boardProductService.getBoardListSize_local(category_local);
    		category_title = "지역별";
        	category_sub.add("강원도");
        	category_sub.add("경기도");
        	category_sub.add("경상북도");
        	category_sub.add("경상남도");
        	category_sub.add("전라북도");
        	category_sub.add("전라남도");
        	category_sub.add("충청북도");
        	category_sub.add("충청남도");
        	category_sub.add("제주도");
        	category_sub.add("울릉도/독도");
    	}else {
        		
            if(category_1 == 1 || (category_2 >= 101 && category_2 <= 105)) {
            	category_title = "쌀/잡곡";
                category_sub.add("백미");
                category_sub.add("현미/찹쌀/흑미");
                category_sub.add("콩/팥/보리");
                category_sub.add("조/수수/깨/기타");
                category_sub.add("곡류선물세트");
            }else if(category_1 == 2 || (category_2 >= 201 && category_2 <= 206)) {
            	category_title = "채소류";
                category_sub.add("감자/고구마");
                category_sub.add("더덕");
                category_sub.add("나물/잎줄기 채소");
               	category_sub.add("건나물/건채소");
               	category_sub.add("버섯류");
               	category_sub.add("옥수수/단호박/기타");
           	}else if(category_1 == 3 || (category_2 >= 301 && category_2 <= 304)) {
           		category_title = "과일";
               	category_sub.add("사과/배");
                category_sub.add("감/홍시/곶감");
               	category_sub.add("견과/건과");
               	category_sub.add("참다래/기타과일");
            }else if(category_1 == 4 || (category_2 >= 401 && category_2 <= 407)) {
            	category_title = "축산물";
                category_sub.add("소고기");
               	category_sub.add("돼지고기");
               	category_sub.add("닭");
               	category_sub.add("계란/알류/가공란");
               	category_sub.add("축산선물세트");
               	category_sub.add("유제품");
               	category_sub.add("기타");
           	}else if(category_1 == 5 || (category_2 >= 501 && category_2 <= 503)) {
            	category_title = "수산물/건어물";
               	category_sub.add("황태/진미채");
               	category_sub.add("수산물선물세트");
               	category_sub.add("기타");
           	}else if(category_1 == 6 || (category_2 >= 601 && category_2 <= 607)) {
           		category_title = "가공식품/떡류";
                category_sub.add("떡");
               	category_sub.add("한과");
               	category_sub.add("면");
               	category_sub.add("음료");
               	category_sub.add("냉장냉동간편조리");
               	category_sub.add("기름");
               	category_sub.add("기타");
           	}else if(category_1 == 7 || (category_2 >= 701 && category_2 <= 704)) {
           		category_title = "김치/반찬/젓갈";
                category_sub.add("김치/절임배추");
               	category_sub.add("반찬/절임");
               	category_sub.add("젓갈");
               	category_sub.add("기타");
           	}else if(category_1 == 8 || (category_2 >= 801 && category_2 <= 808)) {
           		category_title = "장/조청/식초";
               	category_sub.add("간장");
               	category_sub.add("고추장");
               	category_sub.add("된장");
               	category_sub.add("청국장");
               	category_sub.add("장류선물세트");
               	category_sub.add("식초/액젓");
               	category_sub.add("조청");
               	category_sub.add("기타");
           	}else if(category_1 == 9 || (category_2 >= 901 && category_2 <= 907)) {
            	category_title = "건강식품";
               	category_sub.add("유산균");
               	category_sub.add("홍삼/인삼");
               	category_sub.add("건강즙");
               	category_sub.add("영양식/선식");
               	category_sub.add("꿀/로얄젤리");
               	category_sub.add("건강분말/건강환");
               	category_sub.add("기타");
            }else if(category_1 == 10 || (category_2 >= 1001 && category_2 <= 1004)) {
            	category_title = "차류";
                category_sub.add("커피");
                category_sub.add("전통차/허브차/꽃차");
                category_sub.add("커피/차 선물세트");
                category_sub.add("기타");
        	}
    	}

    	
    	model.addAttribute("pageMaker", new PageMaker(page_num, page_amount, vo_list_size));
    	model.addAttribute("category_title", category_title);
    	model.addAttribute("category_sub", category_sub);
    	model.addAttribute("sort_list", sort_list);
    	model.addAttribute("vo_list", vo_list);
    	
		return "BoardProduct/boardProductList";
	}
	
    @GetMapping(value = "/BoardProductView.bo") // 판매글 보기
	public String boardProductView(Model model,@RequestParam(value="board_id") String board_id, @CurrentUser BuyerVO account) {
    	// 아이디 통합시키자 그냥
    	BoardProductVO vo = boardProductService.getBoardProductVO(board_id);
    	model.addAttribute("userId",account.getId());
    	System.out.println("지금 계정 아이디 :" +account.getId());
    	model.addAttribute("vo", vo);
		
		return "BoardProduct/boardProductView";
	}
	
	@RequestMapping(value = "/BoardLocalIntroduce.bo") // 지역특산물
	public String boardLocalIntroduce() {
		
		return "BoardProduct/localIntroduce";
	}
	
	@PostMapping(value = "/BoardProductRegist.bo")  // 상품등록
	public String sellerProductRegisterDB(Model model, @CurrentUser SellerVO account, String title, int category_1, 
			int category_2, int price, int delivery_price, int quantity, //String content, 
			String sales_producer, String product_name, String product_weight, String product_size, 
			int category_local, String product_country, String date_manufacture, String best_before_date, 
			String transgenic, String storage_method, String consumer_consulation, 
			@RequestPart(value="thumbnail_origin", required = false)MultipartFile thumbnail_origin, 
			@RequestPart(value="product_origin_1", required = false)MultipartFile product_origin_1, 
			@RequestPart(value="product_origin_2", required = false)MultipartFile product_origin_2, 
			@RequestPart(value="product_origin_3", required = false)MultipartFile product_origin_3, 
			@RequestPart(value="product_origin_4", required = false)MultipartFile product_origin_4) throws IOException {
		
		// 받아온 값 vo에 세팅 ============================================================================
		BoardProductVO vo = new BoardProductVO();
		vo.setContent("test");    // test값으로 세팅, summernote 건드리는중
		vo.setContent_origin("test");    // test값으로 세팅, summernote 건드리는중
		vo.setSeller_id(account.getId());  // test값으로 세팅, 회원가입 로그인 완료되면 교체
		vo.setTitle(title);
		vo.setCategory_1(category_1);
		vo.setCategory_2(category_2);
		vo.setPrice(price);
		vo.setDelivery_price(delivery_price);
		vo.setQuantity(quantity);
		vo.setSales_producer(sales_producer);
		vo.setProduct_name(product_name);
		vo.setProduct_weight(product_weight);
		vo.setProduct_size(product_size);
		vo.setCategory_local(category_local);
		vo.setProduct_country(product_country);
		vo.setDate_manufacture(date_manufacture);
		vo.setBest_before_date(best_before_date);
		vo.setTransgenic(transgenic);
		vo.setStorage_method(storage_method);
		vo.setConsumer_consulation(consumer_consulation);
		// 받아온 값 vo에 세팅 end =========================================================================
		
		// board_num값 만들어서 세팅 =======================================================================
		int board_num = boardProductService.getBoardNum() + 1;
		vo.setBoard_num(board_num); 
		// board_num값 만들어서 세팅 end ===================================================================
		
		// board_id값 만들어서 세팅 ========================================================================
		SimpleDateFormat format_time = new SimpleDateFormat("yyyyMMdd");
	    String today = format_time.format(Calendar.getInstance().getTime());
	    vo.setBoard_id(today + "-" + board_num); // 오늘날짜(년월일)-게시판번호로 id값 세팅
		// board_id값 만들어서 세팅 end ====================================================================
	    
		// 이미지 파일 저장 및 썸네일 생성 =======================================================================
		String uploadFolder_thumbnail_origin = "C:\\Project156\\upload\\thumbnail_origin"; // 썸네일 원본 업로드 경로
		String uploadFolder_thumbnail_thum = "C:\\Project156\\upload\\thumbnail_thum";  // 썸네일 썸네일 업로드 경로
		String uploadFolder_product_origin = "C:\\Project156\\upload\\product_origin"; // 상품이미지 원본 업로드 경로
		String uploadFolder_product_thum = "C:\\Project156\\upload\\product_thum";  // 상품이미지 썸네일 업로드 경로
//		String uploadFolder_content_origin = "C:\\Project156\\upload\\content_origin"; // 본문 이미지 업로드 경로
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		if(!thumbnail_origin.isEmpty()) {
			File thum_origin_save = imgSave(thumbnail_origin, uploadFolder_thumbnail_origin);
			String thum_thum_name = makeThumbnail(
					thumbnail_origin, thum_origin_save, uploadFolder_thumbnail_thum, 215, 215);
			vo.setThumbnail_origin(thum_origin_save.getName());
			vo.setThumbnail_thum(thum_thum_name);
			
			StringBuilder img_path = new StringBuilder(
					uploadFolder_thumbnail_origin.replace("C:\\Project156\\upload\\", "/img/") 
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setThumbnail_origin_path(img_path.toString());
			img_path.setLength(0);
			
			img_path.append(uploadFolder_thumbnail_thum.replace("C:\\Project156\\upload\\", "/img/")
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setThumbnail_thum_path(img_path.toString());
		}else {
			vo.setThumbnail_thum("no_image_thum.jpg");
			vo.setThumbnail_thum_path("/img/common\\");
		}
		
		boolean imgFlag = false;
				
		if(!product_origin_1.isEmpty()) {
			File product_origin_1_save = imgSave(product_origin_1, uploadFolder_product_origin);
			String product_thum_1_name = makeThumbnail(
			product_origin_1, product_origin_1_save, uploadFolder_product_thum, 100, 100);
			vo.setProduct_origin_1(product_origin_1_save.getName());
			vo.setProduct_thum_1(product_thum_1_name);
			
			StringBuilder img_path = new StringBuilder(
					uploadFolder_product_origin.replace("C:\\Project156\\upload\\", "/img/")
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setProduct_origin_path(img_path.toString());
			img_path.setLength(0);
			
			img_path.append(uploadFolder_product_thum.replace("C:\\Project156\\upload\\", "/img/")
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setProduct_thum_path(img_path.toString());
			
			imgFlag = true;
		}
				
		if(!product_origin_2.isEmpty()) {
			File product_origin_2_save = imgSave(product_origin_2, uploadFolder_product_origin);
			String product_thum_2_name = makeThumbnail(
					product_origin_2, product_origin_2_save, uploadFolder_product_thum, 100, 100);
			vo.setProduct_origin_2(product_origin_2_save.getName());
			vo.setProduct_thum_2(product_thum_2_name);
			
			StringBuilder img_path = new StringBuilder(
					uploadFolder_product_origin.replace("C:\\Project156\\upload\\", "/img/")
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setProduct_origin_path(img_path.toString());
			img_path.setLength(0);
			
			img_path.append(uploadFolder_product_thum.replace("C:\\Project156\\upload\\", "/img/")
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setProduct_thum_path(img_path.toString());
			
			
			imgFlag = true;
		}
				
		if(!product_origin_3.isEmpty()) {
			File product_origin_3_save = imgSave(product_origin_3, uploadFolder_product_origin);
			String product_thum_3_name = makeThumbnail(
					product_origin_3, product_origin_3_save, uploadFolder_product_thum, 100, 100);
			vo.setProduct_origin_3(product_origin_3_save.getName());
			vo.setProduct_thum_3(product_thum_3_name);
			
			StringBuilder img_path = new StringBuilder(
					uploadFolder_product_origin.replace("C:\\Project156\\upload\\", "/img/")
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setProduct_origin_path(img_path.toString());
			img_path.setLength(0);
			
			img_path.append(uploadFolder_product_thum.replace("C:\\Project156\\upload\\", "/img/")
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setProduct_thum_path(img_path.toString());
			
			
			imgFlag = true;
		}
				
		if(!product_origin_4.isEmpty()) {
			File product_origin_4_save = imgSave(product_origin_4, uploadFolder_product_origin);
			String product_thum_4_name = makeThumbnail(
					product_origin_4, product_origin_4_save, uploadFolder_product_thum, 100, 100);
			vo.setProduct_origin_4(product_origin_4_save.getName());
			vo.setProduct_thum_4(product_thum_4_name);
			
			StringBuilder img_path = new StringBuilder(
					uploadFolder_product_origin.replace("C:\\Project156\\upload\\", "/img/")
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setProduct_origin_path(img_path.toString());
			img_path.setLength(0);
			
			img_path.append(uploadFolder_product_thum.replace("C:\\Project156\\upload\\", "/img/")
					+ "\\" + str.replace("-", "\\") + "\\");
			vo.setProduct_thum_path(img_path.toString());
			
			
			imgFlag = true;
		}
		
		
		if(!imgFlag) { // 아무런 대표이미지도 저장되지 않았을 때

			vo.setProduct_origin_1("no_image.jpg");
			vo.setProduct_thum_1("no_image_thum.jpg");
			vo.setProduct_origin_path("/img/common\\");
			vo.setProduct_thum_path("/img/common\\");
		}
		// 이미지 파일 저장 및 썸네일 생성 end ===================================================================				
				
		// 값 들어오는지 확인 ====================================================================
		System.out.println("게시판 id: " + vo.getBoard_id());
		System.out.println("판매자 id: " + vo.getSeller_id());
		System.out.println("게시판 번호: " + vo.getBoard_num());
		System.out.println("제목: " + vo.getTitle());
		System.out.println("판매가: " + vo.getPrice());
		System.out.println("배송비: " + vo.getDelivery_price());
		System.out.println("수량: " + vo.getQuantity());
		System.out.println("본문내용: " + vo.getContent());
		System.out.println("게시글 등록일: " + vo.getRegister_date());
		System.out.println("1차 카테고리: " + vo.getCategory_1());
		System.out.println("2차 카테고리: " + vo.getCategory_2());
		System.out.println("지역 코드: " + vo.getCategory_local());
		System.out.println("판매생산자: " + vo.getSales_producer());
		System.out.println("상품명: " + vo.getProduct_name());
		System.out.println("상품중량: " + vo.getProduct_weight());
		System.out.println("상품크기: " + vo.getProduct_size());
		System.out.println("원산지: " + vo.getProduct_country());
		System.out.println("제조년월일: " + vo.getDate_manufacture());
		System.out.println("품질유지기한: " + vo.getBest_before_date());
		System.out.println("유전자 변형 표기: " + vo.getTransgenic());
		System.out.println("보관방법: " + vo.getStorage_method());
		System.out.println("소비자 상담문의: " + vo.getConsumer_consulation());
		System.out.println("썸네일 원본이름: " + vo.getThumbnail_origin());
		System.out.println("썸네일 썸네일이름: " + vo.getThumbnail_thum());
		System.out.println("대표이미지1 원본이름: " + vo.getProduct_origin_1());
		System.out.println("대표이미지1 썸네일이름: " + vo.getProduct_thum_1());
		System.out.println("대표이미지2 원본이름: " + vo.getProduct_origin_2());
		System.out.println("대표이미지2 썸네일이름: " + vo.getProduct_thum_2());
		System.out.println("대표이미지3 원본이름: " + vo.getProduct_origin_3());
		System.out.println("대표이미지3 썸네일이름: " + vo.getProduct_thum_3());
		System.out.println("대표이미지4 원본이름: " + vo.getProduct_origin_4());
		System.out.println("대표이미지4 썸네일이름: " + vo.getProduct_thum_4());
		System.out.println("썸네일 원본 경로: " + vo.getThumbnail_origin_path());
		System.out.println("썸네일 썸네일 경로: " + vo.getThumbnail_thum_path());
		System.out.println("대표이미지 원본 경로: " + vo.getProduct_origin_path());
		System.out.println("대표이미지 썸네일 경로: " + vo.getProduct_thum_path());
		System.out.println("본문 이미지 경로: " + vo.getContent_origin_path());
		System.out.println("본문이미지 이름: " + vo.getContent_origin());
		System.out.println("판매수: " + vo.getHit());
		System.out.println("조회수: " + vo.getRead_count());
		
		// ======================================================================================
		
		// 데이터베이스에 게시판 등록 ===================================================================
		
		int result = boardProductService.insertBoardProduct(vo);
		if(result == 1) {
			return "redirect:/BoardProductView.bo?board_id=" + vo.getBoard_id();
		}else {
			return null;
		}
		
		// 데이터베이스에 게시판 등록 end ===============================================================
	}
	
	private File imgSave(MultipartFile imgFile, String uploadFolder) {
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
		
		return createFile;
	}
	
	private String makeThumbnail(MultipartFile originFile, File saveFile, String uploadFolder,
			int width, int height) throws IOException{
		// 원본파일, 저장한 원본파일, 썸네일 저장할 경로, 제작할 썸네일의 너비와 높이
		
		// 썸네일 만들기 =====================================================================
		BufferedImage srcImg = ImageIO.read(saveFile);  // 저장된 원본 파일로부터 객체 생성
		
		// 원본 이미지의 썸네일 높이와 너비
		int originWidth = srcImg.getWidth();
		int originHeight = srcImg.getHeight();
		
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이 계산
		int calWidth = originWidth;
		int calHeight = (originWidth * height) / width;
		
		// 계산된 높이가 원본보다 높을 때
		// 원본 높이를 기준으로 하여 썸네일의 비율로 너비 계산
		if(calHeight > originHeight) {
			calWidth = (originHeight * width) / height;
			calHeight = originHeight;
		}
		
		// 계산된 크기로 원본이미지를 가운데서 crop
		BufferedImage cropImg = Scalr.crop(srcImg, 
				(originWidth - calWidth) / 2 , (originHeight - calHeight) / 2 , calWidth, calHeight);
		
		// crop된 이미지로 썸네일 생성
		BufferedImage thum_img = Scalr.resize(cropImg, width, height);
		// 썸네일 만들기 end ============================================================================
		
		File uploadPath = getFolder(uploadFolder); // 오늘 날짜로 경로폴더 만들기
		UUID uuid = UUID.randomUUID();  // 파일이름 중복방지를 위하여 랜덤으로 임의의 값 생성
		StringBuilder thumbnail_thum_name = 
				new StringBuilder(uuid.toString() + "_thum_" + originFile.getOriginalFilename());
		String file_ext = 
				FilenameUtils.getExtension(originFile.getOriginalFilename()); // 원본 확장자명
		File file_thumbnail = 
				new File(uploadPath, thumbnail_thum_name.toString()); // 썸네일 파일 생성
		
		ImageIO.write(thum_img, file_ext, file_thumbnail);
		
		return thumbnail_thum_name.toString();
		
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
	
//	@GetMapping(value = "/imgLoad.bo")
//	public void imgLoadFile(HttpServletRequest req, HttpServletResponse res,
//			@RequestParam("fileDir") String fileDir, @RequestParam("fileName") String fileName){
//		
//		File imgFile = new File(fileDir, fileName);
//		System.out.println(fileDir);
//		System.out.println(fileName);
//		
//		res.setHeader("Content-Length", String.valueOf(imgFile.length()));
//		res.setHeader("Content-Disposition", "inline; filename=\"" + imgFile.getName() + "\"");
//		try {
//			Files.copy(imgFile.toPath(), res.getOutputStream());
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}
	
//    @GetMapping(value = "/display")
//    public ResponseEntity<byte[]> displayFile(
//            @RequestParam("name") String fileName) throws Exception {
//        
//    	InputStream in = null;
//    	ResponseEntity<byte[]> entity = null;
//    	
//    	try {
//    		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
//    		MediaType mType = MediaUtils.getMediaType(formatName);
//    		HttpHeaders headers = new HttpHeaders();
//    		
//    		
//    	}catch(Exception e) {
//    		
//    	}finally {
//    		in.close();
//    	}
//    	
//    	
//    	
//    	
//    	
//    	return entity;
//    }
	
}
