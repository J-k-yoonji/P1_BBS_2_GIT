package egovframework.example.board.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import egovframework.example.board.controller.Criteria;
import egovframework.example.board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

//		@Autowired
//		private SqlSession sqlSession;
		
		@Resource(name = "mapper")
		private BoardMapper mapper;
		
		HttpSession session ;
		
		//페이징 관련.
		//페이지처리한 글 목록
		@Override
		public List<BoardVO> listCri(Criteria cri) throws Exception {
			return mapper.listPageCri(cri);
		}
		
		public int getSeq(int bno) throws Exception {
			return mapper.getSeq(bno);
		}

		//DB 테이블에 있는 모든 글 개수 계산 후 리턴
		@Override
		public int pageCount() throws Exception {
			return mapper.pageCount();
		}
		
		//페이징 (원래 DAOImpl에 있던 코드들!)
		@Override
		public List<BoardVO> listPage(int page) throws Exception {
			//페이지가 0인 경우 1로 바꿔서 처리
			if(page <= 0) {
				page = 1;
			}
			page = (page - 1)*10;
			return mapper.listPage(page);
		}

		//페이징 처리하는 동작(Criteria 객체 사용)
		@Override
		public List<BoardVO> listPageCri(Criteria cri) throws Exception {
			System.out.println("DAO: listPageCri 호출");
//			return session.selectList(namespace+".listPageCri", cri);
			return mapper.listPageCri(cri);
		}
		
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
		
		//답글 작성
		@Override
		public void reWrite(BoardVO boardVO) throws Exception {
			mapper.reWrite(boardVO);
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
		
		//원글 삭제. 
		@Override
		public void delete(int bno) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.delete(bno);
		}
		
		//답글 삭제
		@Override
		public void deleteReWrite(int bno) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.deleteReWrite(bno);
		}

		//파일업로드
		@Override
		public void uploadForm(BoardVO boardVO) throws Exception {
//			TestMapper mapper = sqlSession.getMapper(TestMapper.class);
			mapper.uploadForm(boardVO);
		}

		
}
