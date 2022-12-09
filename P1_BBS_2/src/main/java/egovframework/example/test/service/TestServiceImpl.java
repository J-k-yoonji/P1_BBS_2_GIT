package egovframework.example.test.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.TestVo2;

@Service
public class TestServiceImpl implements TestService{

		@Autowired
		private SqlSession sqlSession;
		
		//게시물 리스트
		@Override
		public List<TestVo> selectList(TestVo testVo) throws Exception{
			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			return mapper.selectList(testVo);
		}
		
		//게시물 작성
		@Override
		public void write(TestVo testVo) throws Exception {
			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.write(testVo);
		}
		
		//게시물 조회
		@Override
		public TestVo view(int bno) throws Exception {
			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			return mapper.view(bno);
		}
		
		//게시물 수정
		@Override
		public void modify(TestVo testVo) throws Exception {
			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.modify(testVo);
		}
		
		//게시물 삭제
		@Override
		public void delete(int bno) throws Exception {
			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.delete(bno);
		}
		
}
