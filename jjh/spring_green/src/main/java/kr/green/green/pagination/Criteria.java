package kr.green.green.pagination;

import lombok.Data;

@Data
public class Criteria {
	//현재 페이지
	private int page; 
	//한 페이지 당 컨텐츠 갯수 . 한 페이지에 보이는 게시글의 갯수. e.g. 1페이지에 보이는 게시글 수 5개
	private int perPageNum;
	//검색어
	private String search;
	//게시글 타입
	private String type;
	//Criteria 디폴트 생성자 : 현재 페이지를 1페이지로, 한 페이지에 10개의 컨텐츠
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.search="";
		this.type = "normal";
	}
	public Criteria(int page,int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		this.search="";
		this.type = "normal";
	}
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	public String getTypeTitle() {
		if(type != null && type.equals("notice"))
			return "공지사항";
		return "게시글";
	}
	
}
