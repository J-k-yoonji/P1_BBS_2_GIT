package egovframework.example.board.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class BoardVo {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String imageFileName;
	private String newFileName;
	
	
//	private int viewCnt;


}