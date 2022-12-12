package egovframework.example.test.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVo;

@Controller
public class TestController {
public static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";	

	@Autowired
	private TestService testService;
	
	@Autowired
	private TestVo testVo;

	@GetMapping("/test")
	public String testPage() {
		return "test";
	}
	
	///////////////////////////

//	@RequestMapping(value = "/testList", method = RequestMethod.GET)
//	public String getTestList(TestVo testVo, Model model) throws Exception {
//
//		model.addAttribute("list", testService.selectList(testVo));
//
//		return "testList";
//	}


//	//게시물 작성 (서버에서 사용자로 데이터 이동 GET메서드)
//	@RequestMapping(value = "/write", method = RequestMethod.GET)
//	public void getWrite() throws Exception {
//	}
	
	//게시물 작성 (사용자에서 서버로 데이터 이동 POST메서드)
	@RequestMapping(value = "/board/addNewArticle", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle (MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		
		// 글 정보를 저장하기 위한 articleMap 생성.
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		
		// 글쓰기창에서 전송된 글 정보를 Map에 key/value로 저장.
		while(enu.hasMoreElements()) {
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		
		//업로드한 이미지 파일을 가져옴.
		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		
		String message ;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
		  //글정보 저장된 articleMap을 Service 클래스의 addArticle() 메서드로 전달합니다.
		  //글정보를 추가한 후 업로드한 이미지파일을 글번호로 명명한 폴더로 이동시킵니다."temp": 이미지파일 업로드 폴더.
		  int bno = testService.addNewArticle(articleMap);
		  if(imageFileName!=null && imageFileName.length()!=0 ) {
			  File srcFile = new 
					             File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\"+ imageFileName );
			  File destDir = new File(ARTICLE_IMAGE_REPO +"\\"+ bno );
			  //이미지파일 이동시키는 메서드 moveFileToDirectory() 
			  FileUtils.moveFileToDirectory(srcFile, destDir, true);
		  }
		  message = "<script>";
		  message += " alert('새글을 추가했습니다.');";
		  message += " location.href='"+multipartRequest.getContextPath()+"/board/articleForm'; ";
		  message += "</script>";
		  resEnt = new ResponseEntity (message, responseHeaders, HttpStatus.CREATED); 
		  
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\"+ imageFileName);
			srcFile.delete();
			
		  message = "<script>";
		  message += " alert('오류가 발생했습니다. 다시 시도해 주세요.'); ";
		  message += " location.href='"+multipartRequest.getContextPath()+"/board/articleForm'; ";
		  message += "</script>";
			
			  resEnt = new ResponseEntity (message, responseHeaders, HttpStatus.CREATED); 
			  e.printStackTrace();			
		}
	return resEnt;
	}
	
//	private int testService(Map<String, Object> articleMap) {
//		// TODO Auto-generated method stub
//		return 0;
//	}



	//글쓰기창을 나타냄.
	@RequestMapping(value = "/board/*Form", method = RequestMethod.GET)
	 private ModelAndView form(HttpServletRequest request, HttpServletResponse response)
	 throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav ;
	}
	
	private String upload(MultipartHttpServletRequest multipartRequest) 
	throws Exception {
	String imageFileName= null;
	Iterator<String> fileNames = multipartRequest.getFileNames();
	
	while(fileNames.hasNext()) {
		String fileName = fileNames.next();
		MultipartFile mFile = multipartRequest.getFile(fileName);
		imageFileName=mFile.getOriginalFilename();
		File file = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\"+ fileName );
		if(mFile.getSize()!=0) {
			if(!file.exists()) {
				file.getParentFile().mkdirs();
				mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\"+ imageFileName));
			}
		}
	}
	return imageFileName ; // 주의 : 책에 없는 부분.
	}
	
//	
//
//	//게시물 조회용 GET메서드
//	@RequestMapping(value = "/view", method = RequestMethod.GET)
//	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
//		TestVo testVo = testService.view(bno);
//		model.addAttribute("view", testVo);
//	}
//	
//	//게시물 수정 (서버에서 사용자로 데이터 이동 GET메서드)
//	@RequestMapping(value = "/modify", method = RequestMethod.GET)
//	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
//		TestVo testVo = testService.view(bno);
//		model.addAttribute("view", testVo);
//		
//		System.out.println("view" + bno);
////		System.out.println("view" + bno+"2");
//	}
//	
//	//게시물 수정 (사용자에서 서버로 데이터 이동 POST메서드)
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String postModify(TestVo testVo) throws Exception {
//		System.out.println("view" + testVo.getBno()+"3");
//		testService.modify(testVo);
//		
//		return "redirect:/view?bno=" + testVo.getBno() ;
//	}
//	
//	//게시물 삭제 (서버에서 사용자로 데이터 이동 GET메서드)
//	@RequestMapping(value = "/delete", method = RequestMethod.GET)
//	public String getDelete(@RequestParam("bno") int bno) throws Exception {
//		testService.delete(bno);
//		return "redirect:/testList" ;
//	}
//	
//	//파일업로드 (서버에서 사용자로 데이터 이동 GET메서드)
//	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
//	public void getUploadForm() throws Exception {
//		System.out.println("uploadForm-1 clear");
//	}
//	
//	//파일업로드 (사용자에서 서버로 데이터 이동 POST메서드)
//	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
//	public String postUploadForm(TestVo testVo) throws Exception {
//		System.out.println("uploadForm-2 clear");
//		testService.uploadForm(testVo);
//		
//		return "redirect:/testList";
//	}
//	
//	//게시물 수정 (사용자에서 서버로 데이터 이동 POST메서드)
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String postModify(TestVo testVo) throws Exception {
//		System.out.println("view" + testVo.getBno()+"3");
//		testService.modify(testVo);
//		
//		return "redirect:/view?bno=" + testVo.getBno() ;
//	}

}
