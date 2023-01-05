package egovframework.example.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.board.vo.BoardVO;
import egovframework.example.board.vo.TestVo2;

@Service
public class BoardServiceImpl implements BoardService{

//		@Autowired
//		private SqlSession sqlSession;
		
		@Resource(name = "mapper")
		private BoardMapper mapper;
		
		//게시물 목록
		@Override
		public List<BoardVO> selectList(BoardVO boardVO) throws Exception{
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			return mapper.selectList(boardVO);
		}
		
		//게시물 작성
		@Override
		public void write(BoardVO boardVO) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.write(boardVO);
//			testMapper.write(testVo);
		}
		
		//게시물 조회
		@Override
		public BoardVO view(int bno) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			return mapper.view(bno);
		}
		
		//게시물 수정
		@Override
		public void modify(BoardVO boardVO) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.modify(boardVO);
		}
		
		//게시물 삭제
		@Override
		public void delete(int bno) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.delete(bno);
		}

		//파일업로드
		@Override
		public void uploadForm(BoardVO boardVO) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.uploadForm(boardVO);
		}

		
}
