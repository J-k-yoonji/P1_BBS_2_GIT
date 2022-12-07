package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.TestVo2;

public interface TestService {

	//게시물 목록
	public List<TestVo> selectList(TestVo testVo) throws Exception;

	//게시물 작성
	public void write(TestVo testVo) throws Exception;

}
