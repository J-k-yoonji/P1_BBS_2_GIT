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
		
		//게시물 리스트
		@Override
		public List<TestVo> selectList(TestVo testVo) throws Exception{
			return testDao.selectList(testVo);
		}
		
		//게시물 작성
		@Override
		public void write(TestVo testVo) throws Exception {
			testDao.write(testVo);
		}
		
}
