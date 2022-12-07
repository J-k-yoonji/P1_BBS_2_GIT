package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.TestVo2;

public interface TestDao {

	public List<TestVo> selectList(TestVo testVo) throws Exception;

}
