package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.TestVo;

public interface TestMapper {

	public List<TestVo> selectList(TestVo testVo) throws Exception;

	public void write(TestVo testVo) throws Exception;

	public TestVo view(int bno) throws Exception;

	public void modify(TestVo testVo) throws Exception;

	public void delete(int bno) throws Exception;
}
