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
	
	//답글 그룹번호 (원글은 자신의 값)
    private int groupNo;
    //답글 정렬 순번
    private int sortSeq;
    //답글 레벨(depth)
//    private Integer boardLvl;

////  계층형 게시판을 위한 추가 필드변수
//	//원글의 번호
//	private int bnoReRef;
////	private int reParentSeq;
//	//원글(답글포함)에 대한 순서
//	private int bnoReSeq;
//	//답글 계층
//	private int bnoReLev;	
	
//    계층형 게시판을 위한 추가 필드변수
//	//원글의 번호
//	private int board_re_ref;
//	private int board_parent_seq;
//	//원글(답글포함)에 대한 순서
//	private int board_re_seq;
//	//답글 계층
//	private int board_re_lev;
	
//	//원글의 번호
//	private int originNo;
//	//원글(답글포함)에 대한 순서
//	private int groupOrd;
//	//답글 계층
//	private int groupLayer;
//	
//	private int viewCnt;
}
