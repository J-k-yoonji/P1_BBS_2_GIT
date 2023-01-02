package egovframework.example.board.service;

import java.util.List;

import egovframework.example.board.vo.BoardVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mapper")
public interface BoardMapper {

	public List<BoardVo> selectList(BoardVo boardVo) throws Exception;

	public void write(BoardVo boardVo) throws Exception;

	public BoardVo view(int bno) throws Exception;

	public void modify(BoardVo boardVo) throws Exception;

	public void delete(int bno) throws Exception;

	public void uploadForm(BoardVo boardVo) throws Exception;
}
