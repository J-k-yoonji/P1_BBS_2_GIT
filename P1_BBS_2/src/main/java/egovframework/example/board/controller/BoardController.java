package egovframework.example.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.vo.BoardVO;

@Controller
public class BoardController  {
	
//	private static String filePath = "C://file_repo/";
	
	@Autowired
	private BoardService boardService;

	@GetMapping("/test")
	public String testPage() {
		return "test";
	}

	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	//R: 게시물 전체 목록 조회
//	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
//	public String getBoardList(BoardVO boardVO, Model model) throws Exception {
//		model.addAttribute("list", boardService.selectList(boardVO));
//
//		return "boardList";
//	}
	
	//페이징
	//페이징처리한 글목록
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listCriGET(Criteria cri, Model model) throws Exception{
		l.info("C: listCri 겟 호출" + cri);
		model.addAttribute("boardList", boardService.listCri(cri));
	}

	//글목록보기(PageMaker객체 사용)
	// http://localhost:9080/board/listPage
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public void listPageGET(Criteria cri, Model model) throws Exception{
		l.info("C: cri는 "+cri);
		model.addAttribute("boardList", boardService.listCri(cri));

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(boardService.pageCount()); //DB의 전체ROW수 입력

		// 뷰페이지로 전달 
		model.addAttribute("pm", pm);
	}

//	//답글 작성  GET메서드
//	@RequestMapping(value = "/boardReply", method = RequestMethod.GET)
//	public void getBoardReply() throws Exception {
//	}
	
	//R: 게시물 상세 조회용 GET메서드
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO boardVO = boardService.view(bno);
		model.addAttribute("view", boardVO);
	}

	//C: 게시물 작성 (서버에서 사용자로 데이터 이동 GET메서드)
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
	}
	
	//회원제게시판으로바꾸며 HttpSession session , String writer , boardVO.setId(writer); 를 추가해줌!ㅎㅎ
	//C: 게시물 작성 (사용자에서 서버로 데이터 이동 POST메서드) //required = false: file1 이 null 값으로 들어와도 허용해줌. value = "file1(파라미터이름)"
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite( BoardVO boardVO, @RequestParam(value = "file1", required = false) MultipartFile report, HttpSession session) throws Exception {
		
		//session에 저장된 id를 writer에 저장  
		String writer = (String) session.getAttribute("id");
		System.out.println("작성자writer :"+ writer);	
		//boardVO에  writer를 세팅
		boardVO.setId(writer);
		
		//파일명
		System.out.println("report"+ report);		
		
		//isBlank : 공백(Whitespace) 혹은 빈 문자열  상태.
		//null : 인스턴스조차 생성되지 않은 상태
		//isEmpty : 객체 인스턴스는 생선되었으나, 객체에 ""란 값으로 들어가 있는 상태.(빈 문자열 상태)
		
		if (!report.isEmpty()) {
			String originalFile = report.getOriginalFilename();
			String filePath = "C://file_repo/";
			///C://download/pororo.png    
			
			File file = new File(filePath  + originalFile);
			
			//파일 저장
			report.transferTo(file);
			String imageFileName = file.getName();
			String ext = imageFileName.substring(imageFileName.lastIndexOf("."));
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			//새로운 파일명 : 업로드일시 + 확장자
			String newFileName = now + ext;
			
			File newFile = new File(filePath  + newFileName);
			file.renameTo(newFile);
	
			boardVO.setImageFileName(imageFileName);
			boardVO.setNewFileName(newFileName);
		}
		// File객체의 값이 빈문자열 "" 인 경우에는 db서버에 null로 저장됨.(첨부한 파일 없어도 글등록 가능!) 
		System.out.println(report.getOriginalFilename());
		
		boardService.write(boardVO);
		return "redirect:/boardList";
	}
	
	
	//C: 게시물 작성 (서버에서 사용자로 데이터 이동 GET메서드)
	@RequestMapping(value = "/reWrite", method = RequestMethod.GET)
	public void getReWrite(@RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO boardVO = boardService.view(bno);
		System.out.println(boardVO.getGroupNo());
		boardVO.setSortSeq(boardService.getSeq(bno));
		boardVO.setGroupNo(bno);
//		boardVO.setGroupNo(bno);
		model.addAttribute("view", boardVO);
		
//		model.addAttribute("groupNo", boardVO.groupNo);
//		model.addAttribute("sortSeq", boardVO.sortSeq);
	}
	
	//회원제게시판으로바꾸며 HttpSession session , String writer , boardVO.setId(writer); 를 추가해줌!ㅎㅎ
	//C: 게시물 작성 (사용자에서 서버로 데이터 이동 POST메서드) //required = false: file1 이 null 값으로 들어와도 허용해줌. value = "file1(파라미터이름)"
	@RequestMapping(value = "/reWrite", method = RequestMethod.POST)
	public String postReWrite( BoardVO boardVO, Model model, @RequestParam(value = "file1", required = false) MultipartFile report, HttpSession session) throws Exception {
		
		model.addAttribute("view", boardVO);
		//session에 저장된 id를 writer에 저장  
		String writer = (String) session.getAttribute("id");
		System.out.println("작성자writer :"+ writer);	
		//boardVO에  writer를 세팅
		boardVO.setId(writer);
		
		//파일명
		System.out.println("report"+ report);		
		
		//isBlank : 공백(Whitespace) 혹은 빈 문자열  상태.
		//null : 인스턴스조차 생성되지 않은 상태
		//isEmpty : 객체 인스턴스는 생선되었으나, 객체에 ""란 값으로 들어가 있는 상태.(빈 문자열 상태)
		
		if (!report.isEmpty()) {
			String originalFile = report.getOriginalFilename();
			String filePath = "C://file_repo/";
			///C://download/pororo.png    
			
			File file = new File(filePath  + originalFile);
			
			//파일 저장
			report.transferTo(file);
			String imageFileName = file.getName();
			String ext = imageFileName.substring(imageFileName.lastIndexOf("."));
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			//새로운 파일명 : 업로드일시 + 확장자
			String newFileName = now + ext;
			
			File newFile = new File(filePath  + newFileName);
			file.renameTo(newFile);
	
			boardVO.setImageFileName(imageFileName);
			boardVO.setNewFileName(newFileName);
		}
		// File객체의 값이 빈문자열 "" 인 경우에는 db서버에 null로 저장됨.(첨부한 파일 없어도 글등록 가능!) 
		System.out.println(report.getOriginalFilename());
		
		boardService.reWrite(boardVO);
		return "redirect:/boardList";
	}
	
	
	
	//U: 게시물 수정 (서버에서 사용자로 데이터 이동 GET메서드)
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify( @RequestParam("bno") int bno, Model model) throws Exception {
		BoardVO boardVO = boardService.view(bno);
		model.addAttribute("view", boardVO);

		String preImagename = boardVO.getImageFileName();
//	    System.out.println( "preImagename1 : " + preImagename);
	}
	
	//U: 게시물 수정 (사용자에서 서버로 데이터 이동 POST메서드)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO boardVO, @RequestParam("preFileName") String preFileName , @RequestParam(value = "file1", required = false) MultipartFile report) throws Exception {
//			System.out.println(testVo.getImageFileName());
	
			// 기존 첨부파일 있다면 가져와서 저장.
//			String preImagename = testVo.getImageFileName();
//			String preImagename = request.getParameter("preFileName") ;
			System.out.println( "preFileName : " + preFileName);	
			String filePath = "C://file_repo/";
			File oldFile = new File(filePath  + preFileName);
			
//			String prevFile1 = report.getOriginalFilename();
//			System.out.println("prevFile1 _ 1 : "+ prevFile1 );
			
			if (!report.isEmpty()) {
				String originalFile = report.getOriginalFilename();
				
				///C://download/pororo.png    
				
				File file = new File(filePath  + originalFile);
				
				//파일 저장
				report.transferTo(file);
				String imageFileName = file.getName();
				String ext = imageFileName.substring(imageFileName.lastIndexOf("."));
				String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				//새로운 파일명 : 업로드일시 + 확장자
				String newFileName = now + ext;
				
				File newFile = new File(filePath  + newFileName);
				file.renameTo(newFile);
				
				//Vo에 저장
				boardVO.setImageFileName(imageFileName);
				boardVO.setNewFileName(newFileName);
				
				//기존파일 삭제
				oldFile.delete();
				
			} else {
				//첨부파일 수정 안하면 기존 이름 유지. 
				boardVO.setImageFileName(preFileName);
				System.out.println("prevFile1 _ 2 : " + preFileName );
				
				//아래 한줄이 없었어서 글만 수정했을땐 제대로 update가 안됐었다.
//				testService.modify(testVo);
//				return "redirect:/view?bno=" + testVo.getBno();
			}
			// File객체의 값이 빈문자열 "" 인 경우에는 db서버에 null로 저장됨.(첨부한 파일 없어도 글등록 가능?!) 
//			System.out.println("report3 : "+ report.getOriginalFilename());
			
			//기존 수정 POST 코드
			boardService.modify(boardVO);
			return "redirect:/view?bno=" + boardVO.getBno();
	}
//	
//	//게시물 수정 (사용자에서 서버로 데이터 이동 POST메서드)
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String postModify(TestVo testVo) throws Exception {
//		testService.modify(testVo);
//		
//		
//		return "redirect:/view?bno=" + testVo.getBno();
//	}
	

	//D: 게시물 삭제 POST방식으로 바꾸자! 
	//게시물 삭제 (서버에서 사용자로 데이터 이동 GET메서드) //JSP책 p.527 참고
	//
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("bno") int bno) throws Exception {
		
		//삭제할 게시글의 bno를 가진 게시글의DB를 불러와 testVo객체에 담아줍니다.(삭제할 게시글의 첨부파일의 '파일명'을 가져오기 위해 생성)
		BoardVO boardVO = boardService.view(bno);
        // 파일의 경로 (첨부파일 업로드 때와 동일한 경로)
        String filePath = "C://file_repo/";
        
        // 삭제할 게시글을 DB에서 삭제하기 전에, 해당 게시글에 업로드했던 첨부파일이 있다면 그 첨부파일의 이름(ImageFileName)을 가져와서 첨부파일삭제 시 사용하도록 해야합니다.
        String saveFileName = boardVO.getNewFileName();
        
        //TestServiceImpl 파일의 delete메소드를 호출하여 해당bno를 가진 게시글의 DB를 삭제한다.
		boardService.delete(bno);
        
		// '삭제할첨부파일 File객체'를 해당 파일경로('파일의 경로+삭제할파일명.확장자')를 통해 'deleteFile File객체'에  넣어줍니다.
        File deleteFile = new File(filePath + saveFileName );
 
        // deleteFile.exists() : 주어진 '삭제할첨부파일 File객체'(deleteFile)이 존재하는지 체크. 존재할경우 true, 존재하지않을경우 false
        if(deleteFile.exists()) {           
            // 삭제할 게시글DB삭제에 이어, 삭제할 게시글의 첨부파일까지 폴더에서 완전히 삭제됩니다.  
            deleteFile.delete();           
        } 
		
		return "redirect:/boardList" ;
	}


//    public void deleteFile(int bno) throws Exception {
//			TestVo testVo = testService.view(bno);
//	        // 파일의 경로 + 파일명
//	        String filePath = "C://file_repo/";
//	        
//	        String saveFileName = testVo.getImageFileName();
//	        
//	        File deleteFile = new File(filePath + saveFileName );
//	 
//	        // 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
//	        if(deleteFile.exists()) {
//	            
//	            // 파일을 삭제합니다.
//	            deleteFile.delete(); 
//	            
//	        } 
//	    }
	
	
	
	//파일업로드 (서버에서 사용자로 데이터 이동 GET메서드)
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void getUploadForm() throws Exception {
		System.out.println("uploadForm-1 clear");
	}
	
	//파일업로드 (사용자에서 서버로 데이터 이동 POST메서드)
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String postUploadForm(BoardVO boardVO) throws Exception {
		System.out.println("uploadForm-2 clear");
		boardService.uploadForm(boardVO);
		
		return "redirect:/boardList";
	}
	
//	//게시물 수정 (사용자에서 서버로 데이터 이동 POST메서드)
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String postModify(TestVo testVo) throws Exception {
//		System.out.println("view" + testVo.getBno()+"3");
//		testService.modify(testVo);
//		
//		return "redirect:/view?bno=" + testVo.getBno() ;
//	}
	

	

}
