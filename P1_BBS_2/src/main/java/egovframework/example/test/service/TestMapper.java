package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.TestVo;

public interface TestMapper {

	public List<TestVo> selectList(TestVo testVo) throws Exception;
}
