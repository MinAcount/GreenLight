package com.green.light.vo;

public class PageVo {

	private int page;
	private int countList;
	private int totalCount;
	private int countPage;
	private int totalPage;
	private int stagePage;
	private int endPage;
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(totalPage < page) {
			page=totalPage;
		}
		this.page = page;
	}
	
	public int getCountList() {
		return countList;
	}
	public void setCountList(int countList) {
		this.countList = countList;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) { //setProperty는 argument가 필수로 입력되어야 하므로, int totalPage를 쓰지 않아도 넣어야 함
		int totalPageResult = totalCount/countList;
		if(totalCount%countList>0) {
			totalPageResult++;
		}
		this.totalPage = totalPageResult;
	}
	
	public int getStagePage() {
		return stagePage;
	}
	public void setStagePage(int stagePage) {
		int stagePageResult = ((page-1)/countPage)*countPage +1;
		this.stagePage = stagePageResult;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		int endPageResult = stagePage+countPage-1;
		if(endPageResult>totalPage) {
			endPageResult=totalPage;
		}
		this.endPage = endPageResult;
	}
	@Override
	public String toString() {
		return "PageVo [page=" + page + ", countList=" + countList + ", totalCount=" + totalCount + ", countPage="
				+ countPage + ", totalPage=" + totalPage + ", stagePage=" + stagePage + ", endPage=" + endPage + "]";
	}
}
