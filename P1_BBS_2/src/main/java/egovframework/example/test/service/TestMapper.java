package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.TestVo2;

public interface TestMapper {

	public List<TestVo> selectList(TestVo testVo) throws Exception;
}
