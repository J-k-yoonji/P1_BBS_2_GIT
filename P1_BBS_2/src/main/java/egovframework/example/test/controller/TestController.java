package egovframework.example.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVo;

@Controller
public class TestController {

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
	public String postWrite(TestVo testVo) throws Exception {
		testService.write(testVo);
		
		return "redirect:/testList";
	}
	
	//게시물 조회용 GET메서드
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {
		TestVo testVo = testService.view(bno);
		model.addAttribute("view", testVo);
	}
	
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
	
	//게시물 삭제 (서버에서 사용자로 데이터 이동 GET메서드)
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
		testService.delete(bno);
		return "redirect:/testList" ;
	}


}
