package egovframework.example.board.service;

import java.util.List;

import egovframework.example.board.vo.BoardVo;

public interface BoardService {

	//게시물 목록
	public List<BoardVo> selectList(BoardVo boardVo) throws Exception;

	//게시물 작성
	public void write(BoardVo boardVo) throws Exception;
	
	//게시물 조회
	public BoardVo view(int bno) throws Exception;
	
	//게시물 수정
	public void modify(BoardVo boardVo) throws Exception;

	//게시물 삭제
	public void delete(int bno) throws Exception;

	//파일업로드
	public void uploadForm(BoardVo boardVo) throws Exception;

}
