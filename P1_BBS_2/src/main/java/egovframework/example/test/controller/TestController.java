package egovframework.example.test.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVo;

@Controller
public class TestController {
	
//	private static String filePath = "C://file_repo/";
	
	@Autowired
	private TestService testService;

	@GetMapping("/test")
	public String testPage() {
		return "test";
	}

	@RequestMapping(value = "/testList", method = RequestMethod.GET)
	public String getTestList(TestVo testVo, Model model) throws Exception {

		model.addAttribute("list", testService.selectList(testVo));

		return "testList";
	}


	//게시물 작성 (서버에서 사용자로 데이터 이동 GET메서드)
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
	}
	
	//게시물 작성 (사용자에서 서버로 데이터 이동 POST메서드)
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite( TestVo testVo, @RequestParam("file1") MultipartFile report) throws Exception {
		//파일명
		String originalFile = report.getOriginalFilename();
//		//파일명 중 확장자만 추출 
//		String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
//		System.out.println(originalFile);
//		System.out.println(originalFileExtension);
		String filePath = "C://file_repo/";
		///C://download/pororo.png    
		
		File file = new File(filePath  + originalFile);
//		System.out.println(file.getName());
		
		//파일 저장
		report.transferTo(file);
		String imageFileName = file.getName();
//		System.out.println(" 1 : " + testVo.getImageFileName());
//		TestVo testVo = new TestVo();
		testVo.setImageFileName(imageFileName);
//		System.out.println(" 2 : " + testVo.getImageFileName());
		testService.write(testVo);
		
		
		return "redirect:/testList";
	}
	
	//게시물 조회용 GET메서드
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		TestVo testVo = testService.view(bno);
		model.addAttribute("view", testVo);

	}
	
////	게시물 조회용 GET메서드 + 첨부파일 조회 기능
//@RequestMapping(value = "/file" )
//public class FileDownload extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doHandle(request, response);
//	}
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
//		doHandle(request, response);
//	}
//	private void doHandle(HttpServletRequest request, HttpServletResponse response) 
//			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
////		response.setContentType("image/jpeg");
//		String bno = (String) request.getParameter("bno");
//		String imageFileName = (String) request.getParameter("imageFileName");
//		System.out.println("imageFileName: " + imageFileName + "bno: " + bno);
//
//		String ARTICLE_IMAGE_REPO = "C://file_repo/";
//		
//		OutputStream out = response.getOutputStream();
//		String path = ARTICLE_IMAGE_REPO + "\\" + bno + "\\" + imageFileName;
//		File imageFile = new File(path);
//
//		response.setHeader("Cache-Control", "no-cache");
//		response.addHeader("Content-disposition", "attachment;fileName=" + imageFileName);
//		FileInputStream in = new FileInputStream(imageFile);
//		byte[] buffer = new byte[1024 * 8];
//		while (true) {
//			int count = in.read(buffer);
//			if (count == -1)
//				break;
//			out.write(buffer, 0, count);
//		}
//		in.close();
//		out.close();		
////				ModelAndView mav = new ModelAndView();
////		mav.addObject("", )
//	}	
//}	
	
	//게시물 수정 (서버에서 사용자로 데이터 이동 GET메서드)
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		TestVo testVo = testService.view(bno);
		model.addAttribute("view", testVo);
		
		System.out.println("view" + bno);
//		System.out.println("view" + bno+"2");
	}
	
	//게시물 수정 (사용자에서 서버로 데이터 이동 POST메서드)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(TestVo testVo) throws Exception {
		System.out.println("view" + testVo.getBno()+"3");
		testService.modify(testVo);
		
		return "redirect:/view?bno=" + testVo.getBno() ;
	}
	
	//게시물 삭제 POST방식으로 바꾸자!
	//게시물 삭제 (서버에서 사용자로 데이터 이동 GET메서드)
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
		testService.delete(bno);
		return "redirect:/testList" ;
	}
	
	//파일업로드 (서버에서 사용자로 데이터 이동 GET메서드)
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void getUploadForm() throws Exception {
		System.out.println("uploadForm-1 clear");
	}
	
	//파일업로드 (사용자에서 서버로 데이터 이동 POST메서드)
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String postUploadForm(TestVo testVo) throws Exception {
		System.out.println("uploadForm-2 clear");
		testService.uploadForm(testVo);
		
		return "redirect:/testList";
	}
	
//	//게시물 수정 (사용자에서 서버로 데이터 이동 POST메서드)
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String postModify(TestVo testVo) throws Exception {
//		System.out.println("view" + testVo.getBno()+"3");
//		testService.modify(testVo);
//		
//		return "redirect:/view?bno=" + testVo.getBno() ;
//	}
	
	@RequestMapping(value = "/upload", method = { RequestMethod.POST, RequestMethod.GET } )
	public class FileUpload extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doHandle(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doHandle(request, response);
		}

		protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String encoding = "utf-8";

//			업로드할 파일 경로 지정
			File currentDirPath = new File("C:\\file_repo");
			DiskFileItemFactory factory = new DiskFileItemFactory();
//			파일 경로 설정
			factory.setRepository(currentDirPath);
//			최대업로드 가능한 파일 크기 설정
			factory.setSizeThreshold(1024 * 1024 * 100);
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
//				request 객체에서 매개변수를 list로 가져옵니다.
				List items = upload.parseRequest(request);
				for (int i = 0; i < items.size(); i++) {
//					파일 업로드창에서 업로드된 항목들을 하나씩 가져옵니다.
					FileItem fileItem = (FileItem) items.get(i);
//			    	폼 필드이면 전송된 매개변수 값을 출력합니다.
					if (fileItem.isFormField()) {
						System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					} else {
//					       폼 필드가 아니면 파일업로드 기능을 수행합니다.
						System.out.println("매개변수이름:" + fileItem.getFieldName());
						System.out.println("파일이름:" + fileItem.getName());
						System.out.println("파일크기:" + fileItem.getSize() + "bytes");
						if (fileItem.getSize() > 0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							if (idx == -1) {
								idx = fileItem.getName().lastIndexOf("/");
							}
//					    	업로드한 파일 이름을 가져옵니다.
							String fileName = fileItem.getFieldName().substring(idx + 1);
//					    	업로드한 파일 이름으로 저장소에 파일을 업로드합니다.
							File uploadFile = new File(currentDirPath + "\\" + fileName);
							fileItem.write(uploadFile);
						} // end if
					} // end if
				} // end for 
		        response.setContentType("text/html; charset=UTF-8");
		        request.setCharacterEncoding("utf-8");
		        PrintWriter out = response.getWriter();
				out.println("<h1>업로드 완료</h1>");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}	
	

}
