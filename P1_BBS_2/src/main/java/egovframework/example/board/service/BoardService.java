package egovframework.example.board.service;

import java.util.List;

import egovframework.example.board.controller.Criteria;
import egovframework.example.board.vo.BoardVO;

public interface BoardService {
	
	//sortSeq값 계산
	public int getSeq(int bno) throws Exception;
	
	//페이징처리한 글목록
	public List<BoardVO> listCri(Criteria cri) throws Exception;

	//DB 테이블에 있는 모든 글 개수 계산 후 리턴
	public int pageCount() throws Exception;
	
	//특정 페이지에 있는 글정보를 확인 
	public List<BoardVO> listPage(int page) throws Exception;
		
	//페이징 처리하는 동작(Criteria 객체 사용)
	public List<BoardVO> listPageCri(Criteria cri) throws Exception;
	

	//게시물 목록
	public List<BoardVO> selectList(BoardVO boardVO) throws Exception;

	//게시물 작성
	public void write(BoardVO boardVO) throws Exception;

	//답글 작성
	public void reWrite(BoardVO boardVO) throws Exception;
	
	//게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	//게시물 수정
	public void modify(BoardVO boardVO) throws Exception;

	//게시물(원글) 삭제. 원글삭제시 답글까지 전부삭제함. 
	public void delete(int bno) throws Exception;

	//답글 삭제
	public void deleteReWrite(int bno) throws Exception;

	//파일업로드 	// ? boardMapper.xml 에는 없음.
	public void uploadForm(BoardVO boardVO) throws Exception;

}
