package egovframework.example.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.board.vo.BoardVo;
import egovframework.example.board.vo.TestVo2;

@Service
public class BoardServiceImpl implements BoardService{

//		@Autowired
//		private SqlSession sqlSession;
		
		@Resource(name = "mapper")
		private BoardMapper mapper;
		
		//게시물 리스트
		@Override
		public List<BoardVo> selectList(BoardVo boardVo) throws Exception{
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			return mapper.selectList(boardVo);
		}
		
		//게시물 작성
		@Override
		public void write(BoardVo boardVo) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.write(boardVo);
//			testMapper.write(testVo);
		}
		
		//게시물 조회
		@Override
		public BoardVo view(int bno) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			return mapper.view(bno);
		}
		
		//게시물 수정
		@Override
		public void modify(BoardVo boardVo) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.modify(boardVo);
		}
		
		//게시물 삭제
		@Override
		public void delete(int bno) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.delete(bno);
		}

		//파일업로드
		@Override
		public void uploadForm(BoardVo boardVo) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.uploadForm(boardVo);
		}

		
}
