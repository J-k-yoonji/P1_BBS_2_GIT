package egovframework.example.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.TestVo2;

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


	//게시물작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception {

	}
	
	//게시물작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(TestVo testVo) throws Exception {
		testService.write(testVo);
		
		return "redirect:/testList";
		
	}


}
