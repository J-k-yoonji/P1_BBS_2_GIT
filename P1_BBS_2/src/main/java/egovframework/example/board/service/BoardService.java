package egovframework.example.board.service;

import java.util.List;

import egovframework.example.board.vo.BoardVO;

public interface BoardService {

	//게시물 목록
	public List<BoardVO> selectList(BoardVO boardVO) throws Exception;

	//게시물 작성
	public void write(BoardVO boardVO) throws Exception;
	
	//게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	//게시물 수정
	public void modify(BoardVO boardVO) throws Exception;

	//게시물 삭제
	public void delete(int bno) throws Exception;

	//파일업로드 	// ? boardMapper.xml 에는 없음.
	public void uploadForm(BoardVO boardVO) throws Exception;

}
