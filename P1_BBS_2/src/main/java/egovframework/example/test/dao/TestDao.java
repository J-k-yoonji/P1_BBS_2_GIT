package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.TestVo2;

public interface TestDao {

	//게시물 목록
	public List<TestVo> selectList(TestVo testVo) throws Exception;
	
	//게시물 작성
	public void write(TestVo testVo) throws Exception;

}
