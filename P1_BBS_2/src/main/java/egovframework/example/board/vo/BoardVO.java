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
	private int recnt; //글목록에 게시글 댓글의 수를 표시해줌

//  답변형 게시판을 위한 추가 필드변수
    private int groupNo; //답글 그룹번호 (원글은 자신의 값)
    private int sortSeq; //답글 정렬 순번
//    private Integer boardLvl; //답글 레벨(depth)

//	private int viewCnt;
    
}
