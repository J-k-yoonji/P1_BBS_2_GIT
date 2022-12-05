package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.vo.TestVo;

public interface TestDao {

	public List<TestVo> selectList(TestVo testVo) throws Exception;

}
