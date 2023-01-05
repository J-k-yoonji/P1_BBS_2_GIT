package egovframework.example.board.service;

import java.util.List;

import egovframework.example.board.vo.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

//BoardService에서 만들어둔 메서드들!
@Mapper("mapper")
public interface BoardMapper {

	public List<BoardVO> selectList(BoardVO boardVO) throws Exception;

	public void write(BoardVO boardVO) throws Exception;

	public BoardVO view(int bno) throws Exception;

	public void modify(BoardVO boardVO) throws Exception;

	public void delete(int bno) throws Exception;

	// ? boardMapper.xml 에는 없음.
	public void uploadForm(BoardVO boardVO) throws Exception;
}
