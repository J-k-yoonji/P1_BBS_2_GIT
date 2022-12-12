package egovframework.example.test.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service("testService")
@Transactional(propagation = Propagation.REQUIRED)
public class TestServiceImpl implements TestService{

		@Autowired
		private SqlSession sqlSession;
		
		@Override 
		public int addNewArticle(Map articleMap) throws Exception{
			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			return mapper.insertNewArticle(articleMap);
		}
		
		@Override 
		public int insertNewArticle(Map articleMap) throws DataAccessException{
			//새 글에 대한 글 번호를 가져옵니다.
			int bno = selectNewArticleNO();
			//글 번호를 articleMap에 저장합니다.
			articleMap.put("bno", bno);
			//id에 대한 insert문을 호출하면서 articleMap을 전달합니다.
			//TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			sqlSession.insert("mapper.board.insertNewArticle",articleMap);			
			return bno ;
		}

		//새 글 번호를 가져옵니다.
		private int selectNewArticleNO() throws DataAccessException{
			return sqlSession.selectOne("mapper.board.selectNewArticleNO");
		}
		
		
		
//		//게시물 리스트
//		@Override
//		public List<TestVo> selectList(TestVo testVo) throws Exception{
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
//			return mapper.selectList(testVo);
//		}
//		
//		//게시물 작성
//		@Override
//		public void write(TestVo testVo) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
//			mapper.write(testVo);
//		}
//		
//		//게시물 조회
//		@Override
//		public TestVo view(int bno) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
//			return mapper.view(bno);
//		}
//		
//		//게시물 수정
//		@Override
//		public void modify(TestVo testVo) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
//			mapper.modify(testVo);
//		}
//		
//		//게시물 삭제
//		@Override
//		public void delete(int bno) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
//			mapper.delete(bno);
//		}
//
//		//파일업로드
//		@Override
//		public void uploadForm(TestVo testVo) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
//			mapper.uploadForm(testVo);
//		}

		
}
