package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.TestVo;

public interface TestService {

	//게시물 목록
	public List<TestVo> selectList(TestVo testVo) throws Exception;

	//게시물 작성
	public void write(TestVo testVo) throws Exception;
	
	//게시물 조회
	public TestVo view(int bno) throws Exception;
	
	//게시물 수정
	public void modify(TestVo testVo) throws Exception;

	//게시물 삭제
	public void delete(int bno) throws Exception;

}
