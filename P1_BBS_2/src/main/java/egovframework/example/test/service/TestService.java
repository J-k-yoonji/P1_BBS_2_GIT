package egovframework.example.test.service;

import java.util.List;
import egovframework.example.test.vo.TestVo;

public interface TestService {

	public List<TestVo> selectList(TestVo testVo) throws Exception;

}
