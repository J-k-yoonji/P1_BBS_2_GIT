package egovframework.example.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.test.service.TestMapper;
import egovframework.example.test.vo.TestVo;
import egovframework.example.test.vo.TestVo2;

@Repository
public class TestDaoImpl implements TestDao{

	@Autowired
	private SqlSession sqlSession;
	
	//게시물 목록
	@Override
	public List<TestVo> selectList(TestVo testVo) throws Exception{
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.selectList(testVo);
	}
	
	//게시물 작성
	public void write(TestVo testVo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.write(testVo);
	}
}
