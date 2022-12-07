package egovframework.example.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.dao.TestDao;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.TestVo2;

@Service
public class TestServiceImpl implements TestService{

		@Autowired
		private TestDao testDao;
		
		@Override
		public List<TestVo> selectList(TestVo testVo) throws Exception{
			return testDao.selectList(testVo);
		}
		
}
