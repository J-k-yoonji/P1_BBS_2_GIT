package egovframework.example.board.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class BoardVO { 
	private int bno;
	private String title;
	private String content;
	private String id;
	private String regDate;
	private String imageFileName;
	private String newFileName;
	
//	private int viewCnt;
}
